//
//  URL+Extension.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation

extension URL {
    func type() -> URLType {
        let imageFormats = ["jpg", "jpeg", "png"]
        let gifFormat = "gif"
        let videoFormats = ["mov", "mp4"]
        
        if imageFormats.contains(pathExtension) {
            return .image
        }
        
        if gifFormat == pathExtension {
            return .gif
        }
        
        if videoFormats.contains(pathExtension) {
            return .video
        }
        
        return .web
    }
}
