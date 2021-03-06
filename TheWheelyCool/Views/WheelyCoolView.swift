//
//  WheelyCoolView.swift
//  TheWheelyCool
//
//  Created by Leialey on 11.02.2020.
//  Copyright © 2020 Ekaterina Rodionova. All rights reserved.
//

import UIKit

@IBDesignable class WheelyCoolView: UIView {
    /// Stored properties
    @IBInspectable var viewColor = UIColor.orange
    @IBInspectable var textColor = UIColor.blue
    @IBInspectable var spinningSpeed = 0.1 //seconds it will take to rotate by 180 degrees
    @IBInspectable var texts = ["Option 1", "Option 2", "Option 3"]
    
    /// Computed properties
    private var numberOfSectors: Int {
        texts.count
    }
    private var sectorsToRotate: CGFloat {
        CGFloat(Int.random(in: 1 ..< 21))
    }
    private var sectorSize: CGFloat {
        //360degrees divided by the number of Sectors
        2 * .pi / CGFloat(numberOfSectors)
    }
    private var targetAngle: CGFloat {
        sectorsToRotate * sectorSize
    }
    private var centerPoint: CGPoint {
        CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    }
    private var textOffset: CGFloat {
        bounds.width / 4
    }
    
    // MARK: - Public methods
    override func draw(_ rect: CGRect) {
        self.drawCircle()
        self.drawTexts()
    }
    
    func spin() {
        spinTo(targetAngle)
    }
    
    // MARK: - Private methods    
    private func drawCircle() {
        //Draw a circle
        viewColor.setFill()
        let outerPath = UIBezierPath(ovalIn: self.bounds)
        outerPath.fill()
    }
    
    private func drawTexts() {
        //Set some attributes for the texts
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                          NSAttributedString.Key.foregroundColor: textColor]
        //It should be configured automatically before draw(_ rect: CGRect)
        guard let context = UIGraphicsGetCurrentContext() else { fatalError("Cannot get current context") }
        
        for (index, text) in texts.enumerated() {
            //Find the corresponding sector
            let angle = CGFloat(index) * sectorSize
            //Bounding box size
            let textBoundBox: CGSize = text.size(withAttributes: attributes)
            context.saveGState()
            context.translateBy(x: centerPoint.x, y: centerPoint.y)
            context.rotate(by: angle)
            //Text should be centered around textOffset
            text.draw(at: CGPoint(x: textOffset - textBoundBox.width / 2,
                                  y: -textBoundBox.height / 2), withAttributes: attributes)
            context.restoreGState()
        }
    }
    
    private func spinTo(_ angle: CGFloat) {
        //As it always finds the shortest path to the target position (clockwise or counter-clockwise),
        //we need to split the target angle into several ones <= 180 degress
        if angle <= 0.0 {
            return
        }
        UIView.animate(withDuration: spinningSpeed, delay: 0, options: .curveLinear, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = self.transform.rotated(by: min(angle, .pi))
        }) { [weak self] finished in
            self?.spinTo(angle - min(angle, .pi))
        }
    }
    
}
