//
//  CollectionViewDelegate.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import UIKit

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let zoomVC = self.storyboard?.instantiateViewController(identifier: "imageViewerVC") as! imgZoomViewController
        zoomVC.imgUrl = self.viewModel.photosFinalResult?[indexPath.row].url ?? ""
        self.navigationController?.pushViewController(zoomVC, animated: true)
    }
}
