//
//  webViewController.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/28/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController, WKUIDelegate {

    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    var youtubeURL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.imageView?.image = #imageLiteral(resourceName: "close-button").withRenderingMode(.alwaysTemplate)
        guard let url  = URL(string: "https://" + youtubeURL!) else {return}
        webView.load(URLRequest(url: url))
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
