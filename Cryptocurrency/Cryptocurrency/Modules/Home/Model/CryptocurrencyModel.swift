//
//  CryptocurrencyModel.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public struct CryptocurrencyModel: Codable {
    
    // MARK: - Public properties -
    
    public var id: String
    public var symbol: String
    public var name: String
    public var image: CriptocurrencyImageModel
    public var market_data: CriptocurrencyMarketDataModel
    
    public init(
        id: String,
        symbol: String,
        name: String,
        image: CriptocurrencyImageModel,
        market_data: CriptocurrencyMarketDataModel
    ) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.image = image
        self.market_data = market_data
    }
    
}

public struct CriptocurrencyMarketDataModel: Codable {
    
    // MARK: - Public properties -
    
    public var price_change_24h: Double
    public var price_change_percentage_24h: Double
    
    public init(
        price_change_24h: Double,
        price_change_percentage_24h: Double
    ) {
        self.price_change_24h = price_change_24h
        self.price_change_percentage_24h = price_change_percentage_24h
    }
}


public struct CriptocurrencyImageModel: Codable {
    // MARK: - Public properties -
    
    public var thumb: String
    public var small: String
    public var large: String
    
    public init(
        thumb: String,
        small: String,
        large: String
    ) {
        self.thumb = thumb
        self.small = small
        self.large = large
    }
}
