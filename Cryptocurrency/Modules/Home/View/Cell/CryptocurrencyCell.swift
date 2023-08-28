//
//  CryptocurrencyCell.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public struct CryptocurrencyCell: View {
    
    struct Constants {
        static let opacity: CGFloat = 0.3
        static let cornerRadius: CGFloat = 10
        static let sizeFontName: CGFloat = 20
        static let spacingNameSymbol: CGFloat = 8
        static let padding: CGFloat = 20
        static let sizeImage: CGFloat = 20
        static let paddingTopImage: CGFloat = 10
    }
    
    // MARK: - Public properties -
    
    public var coin: CryptocurrencyModel
    @State public var isPresentedDetail: Bool = false
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                stackNameSymbol
                Spacer()
                stackPricePercentaje
            }
            .background(Color.gray.opacity(Constants.opacity))
            .cornerRadius(Constants.cornerRadius)
            
            AsyncImage(url: URL(string: coin.image.thumb))
                .frame(width: Constants.sizeImage, height: Constants.sizeImage, alignment: .leading)
                .fixedSize(horizontal: true, vertical: true)
                .padding(.top, -Constants.paddingTopImage)
        }
        .onTapGesture {
            isPresentedDetail.toggle()
        }
        .fullScreenCover(isPresented: $isPresentedDetail, content: {
            DetailCoinView(coin)
        })
    }
    
    // MARK: - Private properties -
    
    private var stackPricePercentaje: some View {
        VStack(alignment: .trailing, spacing: Constants.spacingNameSymbol) {
            Text("\(coin.market_data.price_change_24h)")
                .font(.system(size: Constants.sizeFontName, weight: .bold))
            Text("\(coin.market_data.price_change_percentage_24h)%")
                .foregroundColor(Color.orange)
        }
        .padding(.all, Constants.padding)
    }
    
    private var stackNameSymbol: some View {
        VStack(alignment: .leading, spacing: Constants.spacingNameSymbol) {
            Text(coin.name)
                .font(.system(size: Constants.sizeFontName, weight: .bold))
            Text(coin.symbol.uppercased())
                .foregroundColor(Color.gray)
        }
        .padding(.all, Constants.padding)
    }
    
    // MARK: - Lifecycle -
    
    public init(_ coin: CryptocurrencyModel) {
        self.coin = coin
    }
}
