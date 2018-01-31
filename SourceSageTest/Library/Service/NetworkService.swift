//
//  NetworkService.swift
//  KMP3
//
//  Created by KhuongPham on 1/27/18.
//

import Foundation

class NetworkService {
    func load(completion: ([URL]) -> Void) {
        let urls = [
            "http://afamilycdn.com/thumb_w/650/2017/mytam2-1494555293056.jpg",
            "http://techslides.com/demos/sample-videos/small.mp4",
            "https://www.sourcesage.co",
            "http://afamilycdn.com/thumb_w/650/2017/mytam2-1494555293056.jpg",
            "http://techslides.com/demos/sample-videos/small.mp4",
            "https://www.sourcesage.co",
            "http://afamilycdn.com/thumb_w/650/2017/mytam2-1494555293056.jpg",
            "http://techslides.com/demos/sample-videos/small.mp4",
            "https://www.sourcesage.co",
            "http://afamilycdn.com/thumb_w/650/2017/mytam2-1494555293056.jpg",
            "http://techslides.com/demos/sample-videos/small.mp4",
            "https://www.sourcesage.co",
            "http://afamilycdn.com/thumb_w/650/2017/mytam2-1494555293056.jpg",
            "http://techslides.com/demos/sample-videos/small.mp4",
            "https://www.sourcesage.co"
        ]
        
        completion(urls.flatMap({ URL(string: $0) }))
    }
}

