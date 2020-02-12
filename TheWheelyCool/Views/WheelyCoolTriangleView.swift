//
//  WheelyCoolTriangleView.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

@IBDesignable class WheelyCoolTriangleView: UIView {
    @IBInspectable var viewColor = UIColor.blue
    
    override func draw(_ rect: CGRect) {
        viewColor.setFill()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.size.height / 2))
        path.addLine(to: CGPoint(x: bounds.size.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        path.close()
        path.fill()
    }
}
