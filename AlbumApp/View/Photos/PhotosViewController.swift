//
//  PhotosViewController.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var photosSearchBar: UISearchBar!
    let viewModel = ViewModel()
    var albumId:Int = 1
    var filetedArray: [PhotosModel] = []
    @IBOutlet weak var photosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearch()
        navTitle()
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        bindPhotos()
        viewModel.GetPhotosData(albumId: albumId)
        
       
        
    }
    func navTitle(){
        self.title = "Destination Page"
        self.navigationItem.largeTitleDisplayMode = .always
    }
    func initSearch(){
        photosSearchBar.delegate = self
        definesPresentationContext = true
    }
    func bindPhotos() {
        viewModel.bindPhotosToViewController = { [weak self] in
            DispatchQueue.main.async {
                self?.filetedArray = self?.viewModel.photosFinalResult ?? []
                self?.photosCollectionView.reloadData()
            }
        }
    }
}
