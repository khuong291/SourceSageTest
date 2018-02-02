//
//  VideoCell.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

final class VideoCell: UITableViewCell {
    /// Use for play video
    private var avPlayer: AVPlayer?
    /// Use for present a layer to show video
    private var avPlayerLayer: AVPlayerLayer?
    /// Make user know that the content is on-loading
    fileprivate let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add to contentView
        contentView.addSubview(indicatorView)
        indicatorView.startAnimating()
        // Automatically loop playing video after ending
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: avPlayer?.currentItem, queue: .main) { [weak self] _ in
            self?.avPlayer?.seek(to: kCMTimeZero)
            self?.avPlayer?.play()
        }
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemTimeJumped, object: avPlayer?.currentItem, queue: .main) { [weak self] _ in
            self?.indicatorView.stopAnimating()
        }
    }

    deinit {
        // Should remove observer to avoid memory leak
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avPlayerLayer?.frame = contentView.bounds
        indicatorView.frame = contentView.bounds
    }
    
    func configure(url: URL) {
        avPlayer = AVPlayer(url: url)
        avPlayer?.play()
        // Attach avPlayer to avPlayerLayer
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        // Add avPlayerLayer to contentView layer
        contentView.layer.addSublayer(avPlayerLayer!)
    }
}
