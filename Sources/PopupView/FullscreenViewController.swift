//
//  FullscreenViewController.swift
//  EnnoWallet
//
//  Created by Hayrettin İletmiş on 28.03.2023.
//  Copyright © 2021 EnnoWallet. All rights reserved.
//

import Foundation
import UIKit

class FullscreenViewController: UIView {
    @IBOutlet weak var content: UIView!
    
    weak var delegate: PopupViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    @objc func exit() {
        if self.content == nil { return }
        UIView.animate(withDuration: 0.3) {
            self.content.frame.origin.y = self.frame.height
        } completion: { _ in
            for view in self.subviews {
                view.removeFromSuperview()
            }
            self.removeFromSuperview()
            self.delegate?.exitPopUp()
        }
    }
    
    func setUI() {
        self.frame.origin.x = -1 * self.frame.width
        self.alpha = 0
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
            self.frame.origin.x = 0
            self.alpha = 1
        }
    }
    
    func setView(view: UIView) {
        content.layer.masksToBounds = true
        view.clipsToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: content.frame.width, height: content.frame.height)
        content.addSubview(view)
    }
    
}
