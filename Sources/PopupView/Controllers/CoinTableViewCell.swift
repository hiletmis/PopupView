//
//  CoinTableViewCell.swift
//  EnnoWallet
//
//  Created by Hayrettin İletmiş on 30.08.2019.
//  Copyright © 2019 EnnoWallet. All rights reserved.
//

import UIKit
import Models

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var coinIcon: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinAmount: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    
    var model: BalanceModel?
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    func setModel(model: BalanceModel, icon: UIImage) {
        self.model = model
         
        coinIcon.image = icon
        coinName.text = model.tokenName
        
        if PopupViewNew.shared.isBalanceHidden {
            coinAmount.text = "#"
            type.text =  "#"
        } else {
            coinAmount.text = model.balance.df2so(decimal: 8)
            type.text = "$\(model.exchange.df2so())"
        }
         
        coinPrice.text = "$" + model.price.df2so()
    }
}
 
