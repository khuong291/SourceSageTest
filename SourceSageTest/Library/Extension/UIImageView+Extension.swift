//
//  UIImageView+Extension.swift
//  KMP3
//
//  Created by KhuongPham on 1/28/18.
//

import Foundation
import UIKit

fileprivate struct AssociateKey {
    static var imageService = 0
}

extension UIImageView {
    /// Use for load image from an url
    ///
    /// - Parameter url: url for download
    func loadImage(url: URL) {
        self.imageService = ImageFetchingService(cacheService: CacheService())
        self.imageService?.fetch(url: url, completion: { [weak self] image in
            self?.image = image
        })
    }
    
    
    /// Use for load image from an url and notify that image is loaded or not
    ///
    /// - Parameters:
    ///   - url: url for download
    ///   - completionHandler: notify that image is loaded or not
    func loadImage(url: URL, completionHandler: @escaping (Bool) -> Void) {
        self.imageService = ImageFetchingService(cacheService: CacheService())
        self.imageService?.fetch(url: url, completion: { [weak self] image in
            self?.image = image
            completionHandler(image != nil ? true : false)
        })
    }
    
    /// Use for store property
    private var imageService: ImageFetchingService? {
        get {
            return objc_getAssociatedObject(self, &AssociateKey.imageService) as? ImageFetchingService
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociateKey.imageService,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}
