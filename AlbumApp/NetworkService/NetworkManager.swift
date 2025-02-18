//
//  NetworkManager.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import Combine
import Moya

protocol Networkable {
    var provider: MoyaProvider<ApiHandler> { get }
    func fetchUserFromApi(completion: @escaping (Result<UserModel, ApiErrors>) -> Void)
    func fetchAlumsFromApi(completion: @escaping (Result<[AlbumsModel], ApiErrors>) -> Void)
    func fetchPhotosFromApi(albumId: Int,completion: @escaping (Result<[PhotosModel], ApiErrors>) -> Void)
}

class NetworkManager : Networkable {
    var cancellable = Set<AnyCancellable>()
    static public let sharedInstance = NetworkManager()
    let userRandomId: Int = Int.random(in: 1...10)
    private init() {}
    var provider = MoyaProvider<ApiHandler>()
    //(completion: @escaping (Result<UserModel, ApiErrors>) -> Void)
    func fetchUserFromApi(completion: @escaping (Result<UserModel, ApiErrors>) -> Void) {
      fetchDataFromApi(target: .getUser(id: userRandomId), completion: completion)
    }
    
    func fetchAlumsFromApi(completion: @escaping (Result<[AlbumsModel], ApiErrors>) -> Void) {
         fetchDataFromApi(target: .getAlbum(userId: userRandomId), completion: completion)
    }
    
    func fetchPhotosFromApi(albumId: Int,completion: @escaping (Result<[PhotosModel], ApiErrors>) -> Void) {
        fetchDataFromApi(target: .getPhotos(albumId: albumId), completion: completion)
    }
}

extension NetworkManager {
    func fetchDataFromApi<T: Codable>(
        target: ApiHandler,
        completion: @escaping (Result<T, ApiErrors>) -> Void
    ) {
        provider.requestPublisher(target)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: { completionStatus in
                    switch completionStatus {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                        completion(.failure(.unableToComplete))
                    }
                },
                receiveValue: { decodedData in
                    completion(.success(decodedData))
                }
            )
            .store(in: &cancellable)
    }
}

