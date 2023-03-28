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
}
