//
//  WebViewController.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var wkNewsLink: WKWebView!
    var linkURL : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebview()
    }
    
    func setupWebview()
    {
        let link = URL(string:linkURL ?? "")!
        let request = URLRequest(url: link)
        self.wkNewsLink.load(request)
    }

}
