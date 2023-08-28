//
//  HomeView.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public protocol HomeViewDelegate {
    func displayCoins(with coins: [CryptocurrencyModel])
}

public struct HomeView: View {
    
    struct Constants {
        static let title: String = "Home"
        static let fontSizeTitle: CGFloat = 20
        static let paddingHorizontal: CGFloat = 25
        static let paddingCell: CGFloat = 3
    }
    
    // MARK: - Public properties -
    
    @State public var dataCoins: [CryptocurrencyModel] = []
    @State public var viewModel: HomeViewmodel? = nil
    
    public var body: some View {
        VStack(alignment: .leading) {
            title
                
            List(dataCoins, id: \.id.self) { coin in
                CryptocurrencyCell(coin)
                    .listRowBackground(Color.clear)
                    .padding(.all, Constants.paddingCell)
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .onAppear {
            self.viewModel = HomeViewmodel()
        }
        .onAppear(perform: { configureDataList() })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(.black)
    }
    
    // MARK: - Private properties -
    
    private func configureDataList() {
        viewModel?.view = self
        Task {
            do {
                await viewModel?.viewDidLoad()
            }
        }
    }
    
    private var title: some View {
        Text(Constants.title)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: Constants.fontSizeTitle))
            .padding(.leading, Constants.paddingHorizontal)
    }
}

extension HomeView: HomeViewDelegate {
    public func displayCoins(with coins: [CryptocurrencyModel]) {
        self.dataCoins = coins
    }
}
