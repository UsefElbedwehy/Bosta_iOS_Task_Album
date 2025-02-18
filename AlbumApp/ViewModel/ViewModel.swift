//
//  ViewModel.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation

class ViewModel {
    
    var bindUserToViewController: (()->()) = {}
    var bindAlbumsToViewController: (()->()) = {}
    var bindPhotosToViewController: (()->()) = {}
    
    var userFinalResult : UserModel! {
        didSet {
            bindUserToViewController()
        }
    }
    var albumsFinalResult : [AlbumsModel]? {
        didSet {
            bindAlbumsToViewController()
        }
    }
    var photosFinalResult : [PhotosModel]? {
        didSet {
            bindPhotosToViewController()
        }
    }
    
    func GetUserData() {
        NetworkManager.sharedInstance.fetchUserFromApi { result in
            switch result {
            case .success(let user):
                print("User: \(user.name)")
                self.userFinalResult = user
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    func GetAlbumData() {
        NetworkManager.sharedInstance.fetchAlumsFromApi { result in
            switch result {
            case .success(let albums):
                print("Albums: \(albums)")
                self.albumsFinalResult = albums
            case .failure(let error):
                print("Error  view model: \(error)")
            }
        }
    }
    func GetPhotosData(albumId: Int) {
        NetworkManager.sharedInstance.fetchPhotosFromApi(albumId: albumId) { result in
            switch result {
            case .success(let photos):
                print("Photos: \(photos)")
                self.photosFinalResult = photos
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
