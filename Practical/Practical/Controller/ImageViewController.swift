//
//  ImageViewController.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageScrollview: UIScrollView!
    @IBOutlet weak var newsImage: UIImageView!
    var imageToSet : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollview.delegate = self
        newsImage.image = imageToSet
        self.setZoom()
        // Do any additional setup after loading the view.
    }
    
    func setZoom()
    {
        newsImage.isUserInteractionEnabled = true
        imageScrollview.minimumZoomScale = 1.0
        imageScrollview.maximumZoomScale = 6.0
        imageScrollview.contentSize = .init(width: 2000, height: 2000)
    }
}

extension ImageViewController : UIScrollViewDelegate
{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.newsImage
    }
}
