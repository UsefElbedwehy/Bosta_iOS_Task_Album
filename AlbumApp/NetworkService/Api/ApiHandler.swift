//
//  ApiHandler.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation

struct ApiHandler {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    enum Endpoint {
        case getUser(id: Int)
        case getAlbums(userId: Int)
        case getPhotos(albumId: Int)
        var url: String {
            switch self {
            case .getUser(let id):
                return "\(ApiHandler.baseURL)/users/\(id)"
            case .getAlbums(let id):
                return "\(ApiHandler.baseURL)/albums?userId=\(id)"
            case .getPhotos(let id):
                return "\(ApiHandler.baseURL)/photos?albumId=\(id)"
            }
        }
    }
}
