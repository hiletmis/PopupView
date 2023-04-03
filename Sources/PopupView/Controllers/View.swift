//
//  View.swift
//  EnnoWallet
//
//  Created by Hayrettin İletmiş on 12.06.2021.
//  Copyright © 2021 EnnoWallet. All rights reserved.
//

import Foundation
import UIKit

class View: UIView {
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var classicHeader: UIView!
    
    var isAnimation: Bool = false
    var startPanLocation: CGPoint?
    var startY: CGFloat?
    var isExit: Bool = false
    
    weak var delegate: PopupViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        setVariables()
        setSwipeAction()
    }
    
    func setVariables() {
        let exitTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(exit))
        backgroundView.addGestureRecognizer(exitTapGesture)
    }
    
    private func setSwipeAction() {
        let swipeDown = UIPanGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        self.content.addGestureRecognizer(swipeDown)
    }
     
      @objc func respondToSwipeGesture(panRecognizer: UIPanGestureRecognizer) {
          
        let currentLocation = panRecognizer.location(in: self)

        switch panRecognizer.state {
        case .began:
            startPanLocation = currentLocation
            startY = content.frame.origin.y
            backgroundView.isUserInteractionEnabled = false
        case .changed:
            let dy = currentLocation.y - startPanLocation!.y
            content.frame.origin.y = startY! + dy
        case .ended:
            let dy = currentLocation.y - startPanLocation!.y;
            if dy > 200 {
                exit()
            } else {
                backgroundView.isUserInteractionEnabled = true
                UIView.animate(withDuration: 0.3) {
                    self.content.frame.origin.y = self.startY!
                }
            }
            
            startPanLocation = nil
        default: break
        }
      }
    
    @objc func exit() {
        if isExit {return}
        if self.content == nil {
            return
        }
        UIView.animate(withDuration: 0.3) {
            self.isExit = true
            self.content.frame.origin.y = self.frame.height
            self.backgroundView.alpha = 0
            self.isAnimation = true
        } completion: { _ in
            for view in self.subviews {
                view.removeFromSuperview()
            }
            self.removeFromSuperview()
            self.delegate?.exitPopUp()
        }
    }
    
    func setUI() {
        content.frame.origin.y = self.frame.height
        content.alpha = 0
        backgroundView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.content.frame.origin.y = 0
            self.content.alpha = 1
            self.backgroundView.alpha = 1
            self.isAnimation = true
        } completion: { _ in
            self.isAnimation = false
        }
        content.layer.cornerRadius = 10
    }
    
    func setView(view: UIView) {
        classicHeader.isHidden = true
        content.layer.masksToBounds = true
        view.clipsToBounds = true
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: content.frame.width,
                            height: content.frame.height)
        canvas.addSubview(view)
    }
    
}
