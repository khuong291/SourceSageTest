//
//  HomeController.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation
import UIKit

enum URLType {
    case image
    case gif
    case web
    case video
}

final class HomeController: UITableViewController {
    
    private let cellHeight: CGFloat = 200
    private let networkService = NetworkService()
    private var urls: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(type: ImageCell.self)
        tableView.register(type: GifCell.self)
        tableView.register(type: VideoCell.self)
        tableView.register(type: WebCell.self)
        
        tableView.rowHeight = cellHeight
        
        networkService.load(completion: {
            self.urls = $0
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url = urls[indexPath.row]
        
        switch url.type() {
        case .image:
            let cell = tableView.dequeue(type: ImageCell.self, indexPath: indexPath)
            cell.configure(url: url)
            return cell
        case .gif:
            let cell = tableView.dequeue(type: GifCell.self, indexPath: indexPath)
            cell.configure(url: url)
            return cell
        case .video:
            let cell = tableView.dequeue(type: VideoCell.self, indexPath: indexPath)
            cell.configure(url: url)
            return cell
        case .web:
            let cell = tableView.dequeue(type: WebCell.self, indexPath: indexPath)
            cell.configure(url: url)
            return cell
        }
    }
}
