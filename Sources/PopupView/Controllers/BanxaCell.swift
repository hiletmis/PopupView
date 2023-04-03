//
//  BanxaCell.swift
//  EnnoWallet
//
//  Created by Hayrettin İletmiş on 15.03.2023.
//  Copyright © 2023 EnnoWallet. All rights reserved.
//

import Foundation
import UIKit
import Models

class BanxaCell: UITableViewCell {
    @IBOutlet weak var tokenIcon: UIImageView!
    @IBOutlet weak var paymentMethod1: UIImageView!
    @IBOutlet weak var paymentMethod2: UIImageView!
    @IBOutlet weak var tokenName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var fiat: UILabel!
    @IBOutlet weak var status: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
    public func setCell(model: BanxaModels.BanxaOrdersResponseElement) {
        
        tokenIcon.image = UIImage.init(named: model.coinCode)
        tokenName.text = model.coinCode
        
        amount.text = model.coinAmount.df2so(decimal:8)
        fiat.text = model.fiatAmount.description + " " + model.fiatCode
        
        paymentMethod1.isHidden = false
        paymentMethod2.isHidden = false
        
        if model.paymentType == "WorldPay Credit Card" {
            paymentMethod2.image = UIImage.init(named: "visa")
            paymentMethod1.image = UIImage.init(named: "mc_symbol")
        }
        
        if model.paymentType == "WorldPay ApplePay" {
            paymentMethod1.image = UIImage.init(named: "apple_pay")
            paymentMethod2.isHidden = true
        }
        
        switch model.status {
        case "pendingPayment":
            status.image = UIImage.init(named: "banxa-timer")
            statusLabel.text = "Pending Payment"
            break
        case "waitingPayment":
            status.image = UIImage.init(named: "banxa-timer")
            statusLabel.text = "Waiting Payment"
            break
        case "paymentReceived":
            status.image = UIImage.init(named: "banxa-timer")
            statusLabel.text = "Payment Received"
            break
        case "inProgress":
            status.image = UIImage.init(named: "banxa-timer")
            statusLabel.text = "In Progress"
            break
        case "coinTransferred":
            status.image = UIImage.init(named: "banxa-timer")
            statusLabel.text = "Coin Transferred"
            break
        case "cancelled":
            status.image = UIImage.init(named: "error")
            statusLabel.text = "Canceled"
            break
        case "declined":
            status.image = UIImage.init(named: "error")
            statusLabel.text = "Declined"
            break
        case "expired":
            status.image = UIImage.init(named: "error")
            statusLabel.text = "Expired"
            break
        case "complete":
            status.image = UIImage.init(named: "banxa-check-circle")
            statusLabel.text = "Completed"
            break
        case "refunded":
            status.image = UIImage.init(named: "banxa-check-circle")
            statusLabel.text = "Refunded"
            break
        default:
            break
        }
  
    }
    
    
}

