//
//  Models.swift
//  
//
//  Created by Hayrettin İletmiş on 28.03.2023.
//

import Foundation

public enum HeaderVersion: Int {
    case classic = 1
    case rightAlign = 2
    case headerOnly = 3
    case withBackButton = 4
}

public struct PopupHeaderData {
    public let version: HeaderVersion
    public let header: String
    public let subtitle: String
    public let icon: String
    public let smallIcon: String
    
    public init(version: HeaderVersion, header: String) {
        self.version = version
        self.header = header
        self.subtitle = ""
        self.icon = ""
        self.smallIcon = ""
    }
    
    public init(version: HeaderVersion, header: String, subtitle: String) {
        self.version = version
        self.header = header
        self.subtitle = subtitle
        self.icon = ""
        self.smallIcon = ""
    }
    
    public init(version: HeaderVersion, header: String, subtitle: String, icon: String) {
        self.version = version
        self.header = header
        self.subtitle = subtitle
        self.icon = icon
        self.smallIcon = icon
    }
    
    public init(version: HeaderVersion, header: String, subtitle: String, icon: String, smallIcon: String) {
        self.version = version
        self.header = header
        self.subtitle = subtitle
        self.icon = icon
        self.smallIcon = smallIcon
    }
    
}

public struct BalanceModel: Codable {
    public let tokenName:String
    public let token:String
    public let symbol: String
    public let decimal: Int
    public var balance: Double
    public var exchange: Double
    public var price: Double
    public let network: String
    public let imgUrl: String?
}
