//
//  ViewCorners.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

enum ViewCorners {
    case none
    case top
    case bottom
    case left
    case right
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case all
    case ignoreTopLeft
    case ignoreTopRight
    case ignoreBottomLeft
    case ignoreBottomRight
    
    static func initWith(position: Int) -> Self {
        switch position {
        case 1:
            return .top
        case 2:
            return .bottom
        case 3:
            return .left
        case 4:
            return .right
        case 5:
            return .topLeft
        case 6:
            return .topRight
        case 7:
            return .bottomLeft
        case 8:
            return .bottomRight
        case 9:
            return .all
        case 10:
            return .ignoreTopLeft
        case 11:
            return .ignoreTopRight
        case 12:
            return .ignoreBottomLeft
        case 13:
            return .ignoreBottomRight
        default:
            return .none
        }
    }
    
    var number: Int {
        switch self {
        case .top:
            return 1
        case .bottom:
            return 2
        case .left:
            return 3
        case .right:
            return 4
        case .topLeft:
            return 5
        case .topRight:
            return 6
        case .bottomLeft:
            return 7
        case .bottomRight:
            return 8
        case .all:
            return 9
        case .ignoreTopLeft:
            return 10
        case .ignoreTopRight:
            return 11
        case .ignoreBottomLeft:
            return 12
        case .ignoreBottomRight:
            return 13
        default:
            return 0
        }
    }
    
    var mask: CACornerMask {
        switch self {
        case .top:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .left:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .right:
            return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .topLeft:
            return [.layerMinXMinYCorner]
        case .topRight:
            return [.layerMaxXMinYCorner]
        case .bottomLeft:
            return [.layerMinXMaxYCorner]
        case .bottomRight:
            return [.layerMaxXMaxYCorner]
        case .all:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .ignoreTopLeft:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,
                    .layerMaxXMinYCorner]
        case .ignoreTopRight:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,
                    .layerMinXMinYCorner]
        case .ignoreBottomLeft:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner,
                    .layerMaxXMaxYCorner]
        case .ignoreBottomRight:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        default:
            return []
        }
    }
    
    var rectCorners: UIRectCorner {
        switch self {
        case .top:
            return [.topLeft, .topRight]
        case .bottom:
            return [.bottomLeft, .bottomRight]
        case .left:
            return [.topLeft, .bottomLeft]
        case .right:
            return [.topRight, .bottomRight]
        case .topLeft:
            return [.topLeft]
        case .topRight:
            return [.topRight]
        case .bottomLeft:
            return [.bottomLeft]
        case .bottomRight:
            return [.bottomRight]
        case .all:
            return [.topLeft, .topRight, .bottomLeft, .bottomRight]
        case .ignoreTopLeft:
            return [.topRight, .bottomLeft, .bottomRight]
        case .ignoreTopRight:
            return [.topLeft, .bottomLeft, .bottomRight]
        case .ignoreBottomLeft:
            return [.topLeft, .topRight, .bottomRight]
        case .ignoreBottomRight:
            return [.topLeft, .topRight, .bottomLeft]
        default:
            return []
        }
    }
}

