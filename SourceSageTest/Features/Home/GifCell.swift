//
//  GifCell.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation
import UIKit

final class GifCell: UITableViewCell {
    /// UITableView already has a property called imageView, so we need to call it diferrently
    private var contentImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add to contentView
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.clipsToBounds = true
        contentView.addSubview(contentImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentImageView.frame = contentView.bounds
    }
    
    func configure(url: URL) {
        let imageURL = UIImage.gifImageWithURL(url: url)
        contentImageView = UIImageView(image: imageURL)
    }
}
