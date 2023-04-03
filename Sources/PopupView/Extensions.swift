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


extension Double {
   func removeZerosFromEnd() -> String {
       let formatter = NumberFormatter()
       let number = NSNumber(value: self)
       formatter.minimumFractionDigits = 0
       formatter.maximumFractionDigits = 16
       return String.init(format: formatter.string(from: number) ?? "")
   }
   
  func fitToDecimal(_ decimal: Int) -> String {
      let numberFormatter = NumberFormatter()
      let number = NSNumber(value: self)
      
      numberFormatter.groupingSeparator = ","
      numberFormatter.groupingSize = 3
      numberFormatter.usesGroupingSeparator = true
      numberFormatter.decimalSeparator = "."
      numberFormatter.numberStyle = .decimal
      numberFormatter.maximumFractionDigits = decimal
      
      numberFormatter.minimumFractionDigits = 0
      numberFormatter.maximumFractionDigits = decimal
      return String.init(format: numberFormatter.string(from: number) ?? "")
  }
   
   func percentage() -> String{
      return self.fitToDecimal(2) + "%"
   }
   
  func fitToGwei(_ decimal: Int) -> String {
      let numberFormatter = NumberFormatter()
      let number = NSNumber(value: self)
       
      numberFormatter.usesGroupingSeparator = false
      numberFormatter.decimalSeparator = "."
      numberFormatter.numberStyle = .decimal
      numberFormatter.maximumFractionDigits = decimal
      
      numberFormatter.minimumFractionDigits = decimal
      return String.init(format: numberFormatter.string(from: number) ?? "")
  }
  
   func df2so(decimal: Int = 2) -> String {
       let numberFormatter = NumberFormatter()
       let number = NSNumber(value: self)

       numberFormatter.groupingSeparator = ","
       numberFormatter.groupingSize = 3
       numberFormatter.usesGroupingSeparator = true
       numberFormatter.decimalSeparator = "."
       numberFormatter.numberStyle = .decimal
       numberFormatter.maximumFractionDigits = decimal
 
       if number.doubleValue.isNaN {
           return "0"
       }
       
       return numberFormatter.string(from: number)!
   }
     
   func rounded(_ decimal:Int) -> Double {
       let divisor = pow(10.0, Double(decimal))
       return (self * divisor).rounded() / divisor
   }
    
   func d2Int(_ decimal:Int) -> Int64 {
       let divisor = pow(10.0, Double(decimal))
       let result = self * divisor
       if result > Double.init(INT64_MAX)  {
        return 0
       }
       
       if result.isNaN {
           return 0
       }
       
       return Int64((result))
   }
   
   func symbolize(decimal: Int, coin: String) -> String {
       return String(format: "%@ %@", self.df2so(decimal: decimal), coin)
   }
}

