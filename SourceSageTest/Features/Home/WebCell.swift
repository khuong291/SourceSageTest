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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add to contentView
        contentView.addSubview(webview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        webview.frame = contentView.bounds
    }
    
    func configure(url: URL) {
        webview.stopLoading()
        // Load web content from network base on cache data with 1 hour timeout
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataDontLoad, timeoutInterval: 60 * 60)
        webview.load(urlRequest)
    }
}
