//
//  NetworkManager.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import Combine

protocol Networkable {
    func fetchUserFromApi(completed: @escaping (Result<UserModel, ApiErrors>) -> Void)
    func fetchAlumsFromApi(completed: @escaping (Result<[AlbumsModel], ApiErrors>) -> Void)
    func fetchPhotosFromApi(albumId: Int,completed: @escaping (Result<[PhotosModel], ApiErrors>) -> Void)
}

class NetworkManager : Networkable {
    static private var cancellable:AnyCancellable?
    static public let sharedInstance = NetworkManager()
    private init() {

    }
    let userRandomId:Int = Int.random(in: 1...10)
    
    func fetchUserFromApi(completed: @escaping (Result<UserModel, ApiErrors>) -> Void) {
        fetchDataFromApi(type: UserModel.self, urlStr: ApiHandler.Endpoint.getUser(id: userRandomId).url ,completed: completed)
    }
    
    func fetchAlumsFromApi(completed: @escaping (Result<[AlbumsModel], ApiErrors>) -> Void) {
        fetchDataFromApi(type: [AlbumsModel].self, urlStr: ApiHandler.Endpoint.getAlbums(userId: userRandomId).url ,completed: completed)
    }
    
    func fetchPhotosFromApi(albumId: Int,completed: @escaping (Result<[PhotosModel], ApiErrors>) -> Void) {
        fetchDataFromApi(type: PhotosModel.self, urlStr: ApiHandler.Endpoint.getPhotos(albumId: albumId).url ,completed: completed)
    }
}

extension NetworkManager {
    func fetchDataFromApi<T : Decodable>(type: T.Type, urlStr: String, completed: @escaping (Result<T, ApiErrors>) -> Void) {
        let url = URL(string: urlStr)
                guard let newUrl = url else { return }
                NetworkManager.cancellable = URLSession.shared.dataTaskPublisher(for: newUrl)
                    .map{$0.data}
                    .decode(type: type.self, decoder: JSONDecoder())
                    .mapError { error in
                        switch error {
                        case URLError.cannotFindHost:
                            completed(.failure(.invalidURL))
                            return ApiErrors.invalidURL
                        default:
                            completed(.failure(.unableToComplete))
                            return ApiErrors.unableToComplete
                        }
                    }
                    .sink { _ in
                    } receiveValue: { user in
                        completed(.success(user))
                }
            }
}
