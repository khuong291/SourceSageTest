//
//  UITableView+Extension.swift
//  KMP3
//
//  Created by KhuongPham on 1/26/18.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(type: T.Type) {
        register(type.self, forCellReuseIdentifier: String(describing: type))
    }
    
    func dequeue<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! T
    }
}
