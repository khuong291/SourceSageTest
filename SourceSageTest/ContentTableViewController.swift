//
//  ContentTableViewController.swift
//  echoStream
//
//  Created by MAC on 1/24/18.
//  Copyright © 2018 Huy Nguyen. All rights reserved.
//

import UIKit

class DataView: UIView {
    var url: URL? {
        didSet {
            label.text = url?.absoluteString ?? "No Url"
        }
    }
    
    // You can put you code here
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = bounds
    }
    
    func configureSubviews() {
        addSubview(label)
    }
    

}

class ContentTableViewCell: UITableViewCell {
    let dataView = DataView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dataView.frame = contentView.bounds
    }
    
    private func configureSubviews(){
        contentView.addSubview(dataView)
    }
}

class ContentTableViewController: UITableViewController {
    private static let cellHeight = 80

    private var urls: [URL] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    let testUrls = ["http://afamilycdn.com/thumb_w/650/2017/mytam2-1494555293056.jpg", "http://techslides.com/demos/sample-videos/small.mp4", "https://www.sourcesage.co"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView?.rowHeight = CGFloat(ContentTableViewController.cellHeight)
        urls = testUrls.flatMap{URL(string: $0)}


    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContentTableViewCell
        cell.dataView.url = urls[indexPath.row]
        return cell
    }
}

