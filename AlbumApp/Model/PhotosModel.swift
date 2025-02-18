//
//  PhotosModel.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation

struct PhotosModel: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
