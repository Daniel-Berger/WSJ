//
//  ArticleViewController.swift
//  WSJ
//
//  Created by dberger1 on 12/24/19.
//  Copyright © 2019 dberger1. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    var webView: WKWebView!
    var articleSelectedURL = ""
    var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
        
        setupToolbar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        let articleURL = URL(string: articleSelectedURL)
        let webRequest = URLRequest(url: articleURL!)
        webView.load(webRequest)!
    }
    
    private func setupToolbar() {
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        
        navigationController?.isToolbarHidden = false
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
    }
}

extension ArticleViewController: WKUIDelegate, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
                   
        let ac = UIAlertController(title: "Bad URL", message: "Article URL is not valid", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(ac, animated: true, completion: nil)
        return nil
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        webView.allowsBackForwardNavigationGestures = true
        decisionHandler(.allow)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
}
