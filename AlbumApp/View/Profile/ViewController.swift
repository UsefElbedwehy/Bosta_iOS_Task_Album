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
        bindUser()
        bindAlbums()
        
    }
    func bindUser(){
        viewModel.bindUserToViewController = { () in
            
        }
    }
    func bindAlbums(){
        viewModel.bindAlbumsToViewController = { () in
            
        }
    }

}

