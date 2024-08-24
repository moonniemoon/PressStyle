//
//  PressStyleThemeFactory.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

struct PressStyleThemeFactory {
    static let outlined = PressStyleTheme(
        backgroundColor: Colors.bg,
        textColor: Colors.textColor,
        shadowColor: Colors.regularGray,
        shadowOffset: 1.7,
        borderWidth: 1.9,
        borderColor: Colors.regularGray
    )
    
    static let green = PressStyleTheme(
        backgroundColor: Colors.regularGreen,
        textColor: .white,
        shadowColor: Colors.darkGreen,
        shadowOffset: 3.6,
        borderWidth: nil,
        borderColor: nil
    )
    
    static let blue = PressStyleTheme(
        backgroundColor: Colors.regularBlue,
        textColor: .white,
        shadowColor: Colors.darkBlue,
        shadowOffset: 3.6,
        borderWidth: nil,
        borderColor: nil
    )
    
    static let lightBlue = PressStyleTheme(
        backgroundColor: Colors.regularBlue,
        textColor: .white,
        shadowColor: Colors.darkBlue,
        shadowOffset: 3.6,
        borderWidth: nil,
        borderColor: nil
    )
}

