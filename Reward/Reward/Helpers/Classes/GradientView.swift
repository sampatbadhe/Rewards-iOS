//
//  GradientView.swift
//  Reward
//
//  Created by Darshan on 18/04/21.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.clear {
        didSet {
            setGradientColor()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.clear {
        didSet {
            setGradientColor()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = Point.topLeft.point {
        didSet {
            setGradientColor()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = Point.bottomRight.point {
        didSet {
            setGradientColor()
        }
    }
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGradientColor()
    }
    
    private func setGradientColor() {
        let gradientLayer = layer as? CAGradientLayer
        gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer?.startPoint = startPoint
        gradientLayer?.endPoint = endPoint
    }
    
}

enum Point {
    case topRight, topLeft
    case bottomRight, bottomLeft
    case custom(point: CGPoint)
    
    var point: CGPoint {
        switch self {
        case .topRight: return CGPoint(x: 1, y: 0)
        case .topLeft: return CGPoint(x: 0, y: 0)
        case .bottomRight: return CGPoint(x: 1, y: 1)
        case .bottomLeft: return CGPoint(x: 0, y: 1)
        case .custom(let point): return point
        }
    }
}
