//
//  ApiHandler.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import Moya

enum ApiHandler {
    case getUser(id: Int)
    case getAlbum(userId: Int)
    case getPhotos(albumId: Int)
}

extension ApiHandler : TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .getUser(let id):
            return "/users/\(id)"
        case .getAlbum(_):
            return "/albums"
        case .getPhotos(_):
            return "/photos"
        }
    }

    var method: Moya.Method {
            switch self {
            case .getUser(id: _):
                return .get
            case .getAlbum(userId: _):
                return .get
            case .getPhotos(albumId: _):
                return .get
            }
        }
    
    var task: Moya.Task {
        switch self {
        case .getUser(id: _):
            return .requestPlain
        case .getAlbum(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
        case .getPhotos(let albumId):
            return .requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
