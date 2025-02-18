//
//  imgZoomViewController.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import UIKit

class imgZoomViewController: UIViewController {
    @IBOutlet weak var imgZoomViewer: UIImageView!
    var imgUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        imgZoomViewer.image = UIImage(systemName: "heart")
    }

    
    @objc func shareTapped() {
        guard let image = imgZoomViewer.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
