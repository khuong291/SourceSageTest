//
//  ImageCell.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation
import UIKit

final class ImageCell: UITableViewCell {
    /// UITableView already has a property called imageView, so we need to call it diferrently
    private let contentImageView = UIImageView()
    /// Make user know that the content is on-loading
    fileprivate let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add to contentView
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.clipsToBounds = true
        contentView.addSubview(contentImageView)
        contentView.addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentImageView.frame = contentView.bounds
        indicatorView.frame = contentView.bounds
    }
    
    func configure(url: URL) {
        contentImageView.loadImage(url: url) { [weak self] _ in
            self?.indicatorView.stopAnimating()
        }
    }
}
