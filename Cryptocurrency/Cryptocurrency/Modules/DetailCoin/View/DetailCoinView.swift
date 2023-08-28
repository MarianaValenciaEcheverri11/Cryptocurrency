//
//  DetailCoinView.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public protocol DetailCoinViewDelegate {
    func viewBack()
}

public struct DetailCoinView: View {
    
    struct Constants {
        static let fontSizeName: CGFloat = 30
        static let iconLeftName: String = "chevron.left"
    }
    
    // MARK: - Public properties -
    
    public var coin: CryptocurrencyModel
    @State public var viewModel: DetailCoinViewModel? = nil
    
    public var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: URL(string: coin.image.large))
                Text(coin.name)
                    .font(.system(size: Constants.fontSizeName))
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(.black)
            .navigationBarItems(leading: Button(action: {
                viewModel?.viewBack()
            }) {
                Image(systemName: Constants.iconLeftName)
                    .foregroundColor(.white)
            })
        }.onAppear {
            viewModel = DetailCoinViewModel()
            viewModel?.view = self
        }
    }
    
    // MARK: - Private properties -
    
    @Environment(\.presentationMode) private var presentation
    
    // MARK: - Lifecycle -
    
    public init(_ coin: CryptocurrencyModel) {
        self.coin = coin
    }
}

extension DetailCoinView: DetailCoinViewDelegate {
    public func viewBack() {
        self.presentation.wrappedValue.dismiss()
    }
}
