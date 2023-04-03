//
//  File.swift
//  
//
//  Created by Hayrettin İletmiş on 3.04.2023.
//

import Foundation


public class BanxaModels: NSObject {
  
    // MARK: - BanxaDapp
    public struct BanxaDapp: Codable {
        public let token: String
        public let tokenSymbol: String
        public var walletAddress: String?
        public let blockchain: String
    }


    // MARK: - BanxaTransaction
    public struct BanxaTransaction: Codable {
        public let token: String
        public let tokenSymbol: String
        public let amount: Int64
        public let decimal: Int
        public let fiat: Double
        public let fiatType: String
        public let status: Int
        public let paymentMethod: String
    }

    // MARK: - BanxaRequest
    public struct BanxaRequest: Codable {
        public let wallet, fiat, coin: String
        public let amount: Int
        public let gatewayAddress, blockchain: String
        public var signed, publicKey: String?
        public var timestamp: Int64?
    }

    // MARK: - BanxaGetOrders
    public struct BanxaGetOrders: Codable {
        public let wallet: String
        public var signed, publicKey: String?
        public var timestamp: Int64?
    }
    // MARK: - BanxaResponse
    public struct BanxaResponse: Codable {
        public let order: Order
    }

    // MARK: - Order
    public struct Order: Codable {
        public let id, accountID, accountReference, orderType: String
        public let fiatCode: String
        public let fiatAmount: Int
        public let coinCode, walletAddress: String
        public let blockchain: Blockchain
        public let createdAt: String
        public let checkoutURL: String

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
    public struct Blockchain: Codable {
        public let id: Int?
        public let code, blockchainDescription: String

        enum CodingKeys: String, CodingKey {
            case id, code
            case blockchainDescription = "description"
        }
    }
     
    // MARK: - BanxaOrdersResponseElement
    public struct BanxaOrdersResponseElement: Codable {
        public let id, accountID, accountReference, orderType: String
        public let ref: Int
        public let country, fiatCode: String
        public let fiatAmount: Int64
        public let coinCode: String
        public let coinAmount: Double
        public let walletAddress: String
        public let walletAddressTag: String?
        public let fee, feeTax: Int
        public let paymentFee: Double
        public let paymentFeeTax, commission: Int
        public let txHash: String?
        public let txConfirms: Int
        public let createdDate, createdAt, paymentType, status: String
        public let completedAt: String?
        public let merchantFee: Double
        public let merchantCommission: Int
        public let metaData: String?
        public let blockchain: Blockchain

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
