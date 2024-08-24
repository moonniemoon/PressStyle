//
//  UIView+Ext.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

extension UIView {
    // MARK: - Press Style Animation
    
    var pressStyleView: PressStyleView? {
        subviews.compactMap { $0 as? PressStyleView }.first
    }
    
    func setPressStyle(_ pressStyle: PressStyleTheme, corners: ViewCorners = .all, action: (() -> Void)? = nil) {
        if let pressStyleView = pressStyleView {
            pressStyleView.pressStyle = pressStyle
        } else {
            addPressStyle(pressStyle: pressStyle, corners: corners, action: action)
        }
    }

    func removePressStyle() {
        pressStyleView?.removeFromSuperview()
    }
    
    private func addPressStyle(pressStyle: PressStyleTheme, corners: ViewCorners, action: (() -> Void)? = nil) {
        let pressStyleView = PressStyleView(pressStyle: pressStyle, corners: corners)
        pressStyleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tapGestureRecognizerAction = action
        self.isTapGestureEnabled = true
        
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongTapGesture(_:)))
        tapGesture.minimumPressDuration = 0
        self.addGestureRecognizer(tapGesture)
        
        addSubview(pressStyleView)
        
        NSLayoutConstraint.activate([
            pressStyleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pressStyleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pressStyleView.topAnchor.constraint(equalTo: topAnchor),
            pressStyleView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        layoutIfNeeded()
    }
    
    @objc private func handleLongTapGesture(_ gesture: UILongPressGestureRecognizer) {
        guard let pressStyleView = self.pressStyleView else { return }
        
        let translationY: CGFloat = pressStyleView.pressStyle?.shadowOffset ?? 0
        
        switch gesture.state {
        case .began:
            if isTapGestureEnabled {
                pressStyleView.layer.shadowOpacity = 0
                transform = CGAffineTransform(translationX: 0, y: translationY)
                vibrateOnTap()
            }
        case .ended, .cancelled, .failed:
            if isTapGestureEnabled {
                tapGestureRecognizerAction?()
            }
            pressStyleView.layer.shadowOpacity = 1
            transform = .identity
        default:
            break
        }
    }
    
    func vibrateOnTap() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
    
    // MARK: - Tap Gesture Recognizer
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer: UInt8 = 0
        static var isTapGestureEnabled: UInt8 = 1
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    fileprivate var tapGestureRecognizerAction: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var isTapGestureEnabled: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectKeys.isTapGestureEnabled) as? Bool ?? true
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.isTapGestureEnabled, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setTapGestureEnabled(_ enabled: Bool) {
        isTapGestureEnabled = enabled
    }
}
