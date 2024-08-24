//
//  PressStyleView.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

class PressStyleView: UIView {
    
    var pressStyle: PressStyleTheme? {
        didSet {
            pressStyleLayer?.pressStyle = pressStyle
            backgroundColor = pressStyle?.backgroundColor
        }
    }
    
    override class var layerClass: AnyClass {
        PressStyleLayer.self
    }
    
    private var pressStyleLayer: PressStyleLayer? {
        layer as? PressStyleLayer
    }
    
    init(pressStyle: PressStyleTheme, corners: ViewCorners = .all) {
        super.init(frame: .zero)
        self.pressStyle = pressStyle
        backgroundColor = pressStyle.backgroundColor
        pressStyleLayer?.pressStyle = pressStyle
        pressStyleLayer?.corners = corners
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pressStyleLayer?.frame = bounds
        pressStyleLayer?.updateShadowPath(bounds: bounds)
    }
}

