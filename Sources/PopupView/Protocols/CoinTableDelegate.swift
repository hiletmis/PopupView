//
//  File.swift
//  
//
//  Created by Hayrettin İletmiş on 4.04.2023.
//

import Foundation
import Models

protocol CoinTableDelegate: AnyObject {
    func clickIcon(coin: BalanceModel)
}
