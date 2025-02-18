//
//  CollectionViewDataSource.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import UIKit

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filetedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! GridCollectionViewCell
        cell.photoImgView.image = UIImage(systemName: "heart")
        return cell
    }
}
