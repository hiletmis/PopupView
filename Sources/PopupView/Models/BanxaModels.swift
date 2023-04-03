//
//  File.swift
//  
//
//  Created by Hayrettin İletmiş on 3.04.2023.
//

import Foundation


public class BanxaModels: NSObject {
  
    // MARK: - BanxaDapp
    struct BanxaDapp: Codable {
        let token: String
        let tokenSymbol: String
        var walletAddress: String?
        let blockchain: String
    }


    // MARK: - BanxaTransaction
    struct BanxaTransaction: Codable {
        let token: String
        let tokenSymbol: String
        let amount: Int64
        let decimal: Int
        let fiat: Double
        let fiatType: String
        let status: Int
        let paymentMethod: String
    }

    // MARK: - BanxaRequest
    struct BanxaRequest: Codable {
        let wallet, fiat, coin: String
        let amount: Int
        let gatewayAddress, blockchain: String
        var signed, publicKey: String?
        var timestamp: Int64?
    }

    // MARK: - BanxaGetOrders
    struct BanxaGetOrders: Codable {
        let wallet: String
        var signed, publicKey: String?
        var timestamp: Int64?
    }
    // MARK: - BanxaResponse
    struct BanxaResponse: Codable {
        let order: Order
    }

    // MARK: - Order
    struct Order: Codable {
        let id, accountID, accountReference, orderType: String
        let fiatCode: String
        let fiatAmount: Int
        let coinCode, walletAddress: String
        let blockchain: Blockchain
        let createdAt: String
        let checkoutURL: String

        enum CodingKeys: String, CodingKey {
            case id
            case accountID = "account_id"
            case accountReference = "account_reference"
            case orderType = "order_type"
            case fiatCode = "fiat_code"
            case fiatAmount = "fiat_amount"
            case coinCode = "coin_code"
            case walletAddress = "wallet_address"
            case blockchain
            case createdAt = "created_at"
            case checkoutURL = "checkout_url"
        }
    }

    // MARK: - Blockchain
    struct Blockchain: Codable {
        let id: Int?
        let code, blockchainDescription: String

        enum CodingKeys: String, CodingKey {
            case id, code
            case blockchainDescription = "description"
        }
    }
     
    // MARK: - BanxaOrdersResponseElement
    struct BanxaOrdersResponseElement: Codable {
        let id, accountID, accountReference, orderType: String
        let ref: Int
        let country, fiatCode: String
        let fiatAmount: Int64
        let coinCode: String
        let coinAmount: Double
        let walletAddress: String
        let walletAddressTag: String?
        let fee, feeTax: Int
        let paymentFee: Double
        let paymentFeeTax, commission: Int
        let txHash: String?
        let txConfirms: Int
        let createdDate, createdAt, paymentType, status: String
        let completedAt: String?
        let merchantFee: Double
        let merchantCommission: Int
        let metaData: String?
        let blockchain: Blockchain

        enum CodingKeys: String, CodingKey {
            case id
            case accountID = "account_id"
            case accountReference = "account_reference"
            case orderType = "order_type"
            case ref, country
            case fiatCode = "fiat_code"
            case fiatAmount = "fiat_amount"
            case coinCode = "coin_code"
            case coinAmount = "coin_amount"
            case walletAddress = "wallet_address"
            case walletAddressTag = "wallet_address_tag"
            case fee
            case feeTax = "fee_tax"
            case paymentFee = "payment_fee"
            case paymentFeeTax = "payment_fee_tax"
            case commission
            case txHash = "tx_hash"
            case txConfirms = "tx_confirms"
            case createdDate = "created_date"
            case createdAt = "created_at"
            case paymentType = "payment_type"
            case status
            case completedAt = "completed_at"
            case merchantFee = "merchant_fee"
            case merchantCommission = "merchant_commission"
            case metaData = "meta_data"
            case blockchain
        }
    }

    typealias BanxaOrdersResponse = [BanxaOrdersResponseElement]

}
