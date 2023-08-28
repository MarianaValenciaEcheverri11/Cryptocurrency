//
//  CriptoCTAButton.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public struct CriptoCTAButtonStyle: ButtonStyle {
    
    struct Constants {
        static let cornerRadius: CGFloat = 10
        static let verticalPadding: CGFloat = 16
    }
    
    // MARK: - Public properties -
    
    public var typeButton: CriptoCTAButtonType = .access
    
    
    // MARK: - Public methods -
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, Constants.verticalPadding)
            .background(
                LinearGradient(gradient: Gradient(colors: typeButton.colors), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundStyle(.white)
            .cornerRadius(Constants.cornerRadius)
    }
}
