//
//  ViewController.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumsTableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
        bindUser()
        bindAlbums()
        viewModel.GetUserData()
        viewModel.GetAlbumData()
        
    }
    func bindUser(){
        viewModel.bindUserToViewController = { [weak self] in
            DispatchQueue.main.async {
                self?.nameLabel.text = self?.viewModel.userFinalResult?.name
                self?.emailLabel.text = self?.viewModel.userFinalResult?.email
                self?.albumsTableView.reloadData()
            }
        }
    }
    func bindAlbums(){
        viewModel.bindAlbumsToViewController = { () in
            DispatchQueue.main.async { [weak self] in
                self?.albumsTableView.reloadData()
            }
        }
    }

}




