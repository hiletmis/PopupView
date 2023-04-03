//
//  Extensions.swift
//  
//
//  Created by Hayrettin İletmiş on 27.03.2023.
//

import Foundation
import UIKit

extension UIView {
    func loadNib(name: String) -> UIView {
        return Bundle.module.loadNibNamed(name, owner: self, options: nil)?.first as! UIView
    }
    
    func loadView<T>(name: String, conformance: T.Type) -> T? {
        guard let bundle = Bundle.module.loadNibNamed(name, owner: self, options: nil) else {return nil}
        return bundle.first as? T
    }
    
    func shadowPreset1(rad: CGFloat = 10) {
        layer.cornerRadius = rad
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.masksToBounds = false
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
