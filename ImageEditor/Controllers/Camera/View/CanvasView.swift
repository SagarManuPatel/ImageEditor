//
//  CanvasView.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit

class Canvas: UIImageView {
    
    // public function
    fileprivate var strokeColor = UIColor.red
    fileprivate var strokeWidth: Float = 1
    var isClear : Bool = false
    
    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    var previousPoint1 = CGPoint()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        previousPoint1 = touch.previousLocation(in: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let previousPoint2 = previousPoint1
        previousPoint1 = touch.previousLocation(in: self)
        let currentPoint = touch.location(in: self)


        // calculate mid point
        let mid1 = midPoint(p1: previousPoint1, p2: previousPoint2)
        let mid2 = midPoint(p1: currentPoint, p2: previousPoint1)

        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 2.0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        if let image = self.image {
            image.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        }
    
        context.move(to: mid1)
        context.addQuadCurve(to: mid2, control: previousPoint1)
        
        if isClear {
            context.setBlendMode(.clear)
        }else{
            context.setBlendMode(.normal)
        }
        context.setLineCap(.round)
        context.setLineWidth(CGFloat(self.strokeWidth))
        context.setStrokeColor(self.strokeColor.cgColor)
        context.strokePath()

        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(x: (p1.x + p2.x) / 2.0, y: (p1.y + p2.y) / 2.0)
    }
    
}
