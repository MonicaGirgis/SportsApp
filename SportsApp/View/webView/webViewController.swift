//
//  webViewController.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/28/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    var youtubeURL : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url  = URL(string: youtubeURL ?? "") else {return}
        webView.load(URLRequest(url: url))
        //UIApplication.shared.
    }

}
