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
    private var avPlayerLayer: AVPlayerLayer?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer?.frame = contentView.bounds
        contentView.layer.addSublayer(avPlayerLayer!)
    }
    
    func configure(url: URL) {
        avPlayer = AVPlayer(url: url)
        avPlayer?.play()
    }
}
