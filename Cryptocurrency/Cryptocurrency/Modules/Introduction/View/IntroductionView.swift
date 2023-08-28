//
//  IntroductionView.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public protocol IntroductionViewDelegate {
    func navigateToHome()
}

public struct IntroductionView: View {
    
    struct Constants {
        static let spacingTextsHeader: CGFloat = 30
        static let fontSizeTitle: CGFloat = 38
        static let horizontalPadding: CGFloat = 20
        static let spacingButtons: CGFloat = 16
        static let title: String = "Welcome to CryptoWallet!"
        static let buttonTitleGenerate: String = "GENERATE NEW GALLET"
        static let buttonTitleCapture: String = "OR CAPTURE"
        static let buttonTitleAccess: String = "ACCESS WALLET"
        static let description: String = "if you are creating a new wallet press the GENERATE button. Take note of the mnemonic phrase, " +
                                                                                                                "it should be stored in a safe place."
        static let bodyText: String = "address list elephant genuine thunder conduct avocado educate chronic useless basic rough notable noble" +
                                                                                            "water bless labor monster muscle nike view caution river flavor"
    }
    
    // MARK: - Public properties -
    
    @State public var isPresentedHome: Bool = false
    @State public var viewModel: IntroductionViewModel? = nil
    
    public var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            textsHeader
            Spacer()
            title
            Spacer()
            buttonsWalletCapture
            Spacer()
            buttonAcces
            Spacer()
        }
        .fullScreenCover(isPresented: $isPresentedHome, content: {
            HomeView()
        })
        .onAppear {
            self.viewModel = IntroductionViewModel()
            self.viewModel?.view = self
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(.black)
    }
    
    // MARK: - Private properties -
    
    private var title: some View {
        Text(Constants.bodyText)
            .multilineTextAlignment(.center)
    }
    
    private var buttonAcces: some View {
        Button(action: accessWallet) {
            Text(Constants.buttonTitleAccess)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .buttonStyle(CriptoCTAButtonStyle())
    }
    
    private var textsHeader: some View {
        VStack(alignment: .leading, spacing: Constants.spacingTextsHeader) {
            Text(Constants.title)
                .multilineTextAlignment(.leading)
                .font(.system(size: Constants.fontSizeTitle))
                .fontWeight(.bold)
            Text(Constants.description)
                .foregroundColor(.gray)
        }
    }
    
    private var buttonsWalletCapture: some View {
        VStack(alignment: .center, spacing: Constants.spacingButtons) {
            Button(action: generateNewWallet) {
                Text(Constants.buttonTitleGenerate)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, Constants.horizontalPadding)
            .buttonStyle(CriptoCTAButtonStyle(typeButton: .generate))
            
            Button(Constants.buttonTitleCapture, action: capture)
        }
    }
    
    // MARK: - Private methods -
    
    private func accessWallet() {
        navigateToHome()
    }
    
    private func generateNewWallet() {
        print("generate")
    }
    
    private func capture() {
        print("capture")
    }
}

extension IntroductionView: IntroductionViewDelegate {
    public func navigateToHome() {
        self.isPresentedHome.toggle()
    }
}
