//
//  PressStyleLayer.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

class PressStyleLayer: CALayer {
    var pressStyle: PressStyleTheme? {
        didSet {
            configureStyle()
        }
    }
    
    var corners: ViewCorners = .all {
        didSet {
            maskedCorners = corners.mask
        }
    }
    
    override init() {
        super.init()
        configureLayer()
        configureStyle()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayer() {
        shadowRadius = 0
        shadowOpacity = 1
        cornerRadius = 12
        cornerCurve = .continuous
        maskedCorners = corners.mask
    }
    
    private func configureStyle() {
        guard let pressStyle = pressStyle else {
            borderWidth = 0
            borderColor = nil
            shadowOffset = .zero
            shadowColor = nil
            return
        }
        
        borderWidth = pressStyle.borderWidth ?? 0
        borderColor = pressStyle.borderColor?.cgColor ?? .none
        shadowOffset = CGSize(width: 0, height: pressStyle.shadowOffset)
        shadowColor = pressStyle.shadowColor.cgColor
    }
    
    func updateShadowPath(bounds: CGRect) {
        self.shadowPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners.rectCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        self.contentsScale = UIScreen.main.scale
    }
}
