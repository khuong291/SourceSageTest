//
//  WebCell.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation
import UIKit
import WebKit

final class WebCell: UITableViewCell {
    /// Use for loading web content
    private let webview = WKWebView()
    /// Make user know that the content is on-loading
    fileprivate let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add to contentView
        webview.navigationDelegate = self
        contentView.addSubview(webview)
        contentView.addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        webview.frame = contentView.bounds
        indicatorView.frame = contentView.bounds
    }
    
    func configure(url: URL) {
        webview.stopLoading()
        // Load web content from network that ignore cache data
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 60 * 60)
        webview.load(urlRequest)
    }
}

extension WebCell: WKNavigationDelegate {
    /// Stop indicator animating when webview load success
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicatorView.stopAnimating()
    }
    
    /// Stop indicator animating when webview load fail
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicatorView.stopAnimating()
    }
}
