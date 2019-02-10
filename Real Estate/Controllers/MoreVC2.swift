//
//  MoreVC2.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 2/9/19.
//  Copyright © 2019 Nayef Alotaibi. All rights reserved.
//

import UIKit
import WebKit

class MoreVC2: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://aqaratkm.com/login-register/")!
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
        webview.scrollView.delegate = self
        
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
    
    
}




extension MoreVC2: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
}
