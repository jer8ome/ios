//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Jerome on 2018/12/17.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://www.163.com") {
            webView.load(URLRequest(url: url))
        }
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: urlTF.text!){
            webView.load(URLRequest(url: url))
        }
    }
}

