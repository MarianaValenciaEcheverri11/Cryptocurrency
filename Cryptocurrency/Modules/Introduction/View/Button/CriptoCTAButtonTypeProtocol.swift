//
//  CriptoCTAButtonStyleProtocol.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import SwiftUI

public protocol CriptoCTAButtonTypeProtocol {
    var colors: [Color] { get }
}

public enum CriptoCTAButtonType: CriptoCTAButtonTypeProtocol {
    case generate
    case access
    
    static let opacity: CGFloat = 0.3
    
    public var colors: [Color] {
        switch self {
        case .generate:
            return [Color.gray.opacity(CriptoCTAButtonType.opacity)]
        case .access:
            return [Color(hex: "42885f"), Color(hex: "278686")]
        }
    }
}
