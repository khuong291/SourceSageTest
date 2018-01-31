//
//  HomeController.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/31/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import Foundation
import UIKit

final class HomeController: UITableViewController {
    
    private let cellHeight: CGFloat = 80
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
        let cell = tableView.dequeue(type: WebCell.self, indexPath: indexPath)
        return cell
    }
}
