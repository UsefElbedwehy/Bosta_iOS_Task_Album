//
//  AlbumsTableViewDelegate.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import UIKit

extension ViewController:  UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosVC = self.storyboard?.instantiateViewController(identifier: "photosVC") as! PhotosViewController
        photosVC.albumId = viewModel.albumsFinalResult?[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
}
