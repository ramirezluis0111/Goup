//
//  Animations.swift
//  GoUp_21
//
//  Created by Ramirez Luis on 24/05/2021.
//

import Foundation
import UIKit

func createCircle(nameShape: CAShapeLayer, colorStroke: UIColor, colorFill: UIColor, position: CGPoint) {
    let circleShadow = UIBezierPath(arcCenter: .zero, radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
    
    nameShape.path = circleShadow.cgPath
    nameShape.strokeColor = colorStroke.cgColor
    nameShape.lineWidth = 2.5
    nameShape.fillColor = colorFill.cgColor
    nameShape.lineCap = CAShapeLayerLineCap.round
    nameShape.position = position
    
}
