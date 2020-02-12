//
//  WheelyCoolTriangleView.swift
//  TheWheelyCool
//
//  Created by Leialey on 10.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

class WheelyCoolTriangleView: UIView {
    var viewColor = UIColor.blue
    
    override func draw(_ rect: CGRect) {
        viewColor.setFill()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.frame.size.height / 2))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
        path.fill()
    }
}
