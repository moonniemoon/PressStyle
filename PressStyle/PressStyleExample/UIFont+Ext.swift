//
//  UIFont+Ext.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

extension UIFont {
    func rounded() -> UIFont {
        guard let descriptor = fontDescriptor.withDesign(.rounded) else {
            return self
        }
        
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
