//
//  SearchBarDelegate.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import Foundation
import UIKit

extension PhotosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filetedArray = viewModel.photosFinalResult ?? []
        } else {
            filetedArray = viewModel.photosFinalResult?.filter { $0.title.lowercased().contains(searchText.lowercased()) } ?? []
        }
        print(searchText)
        self.photosCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset the search results
        filetedArray = viewModel.photosFinalResult ?? []
        self.photosCollectionView.reloadData()
    }
}
