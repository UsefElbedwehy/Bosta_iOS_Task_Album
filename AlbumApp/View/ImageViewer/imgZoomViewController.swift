//
//  imgZoomViewController.swift
//  AlbumApp
//
//  Created by Usef on 18/02/2025.
//

import UIKit
import SDWebImage
class imgZoomViewController: UIViewController {
    @IBOutlet weak var imgZoomViewer: UIImageView!
    var imgUrl = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScroll()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        imgZoomViewer.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(systemName: "heart.fill"))
    }
    func setUpScroll(){
        scrollView.delegate = self
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

extension imgZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgZoomViewer
    }
}
