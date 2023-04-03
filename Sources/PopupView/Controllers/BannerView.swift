//
//  BannerView.swift
//  EnnoWallet
//
//  Created by Hayrettin İletmiş on 17.06.2021.
//  Copyright © 2021 EnnoWallet. All rights reserved.
//

import Foundation
import UIKit

class BannerView: UIView {
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    
    weak var delegate: BannerDelegate?

    var url: String?
    var imageUrl: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @objc func openWebView() {
        if let delegate = delegate {
            if let url = url {
                delegate.showWebView(url: url)
            }
        }
    }
    
    func setUI() {
        self.layer.cornerRadius = Constants.CORNER_RADIUS
        banner.layer.cornerRadius = 3
         
        if let imageUrl = imageUrl {
            banner.downloaded(from: imageUrl)
        }
        
        bannerView.shadowPreset1()

        bannerView.layer.masksToBounds = true
        banner.clipsToBounds = true
 
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openWebView))
        bannerView.addGestureRecognizer(tap)

    }
    
}
