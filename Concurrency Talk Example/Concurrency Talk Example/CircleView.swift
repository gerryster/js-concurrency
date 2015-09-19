//
//  CircleView.swift
//  Concurrency Talk Example
//
//  Created by Ryan Gerry on 9/16/15.
//  Copyright (c) 2015 Ryan Gerry. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    //Use property observer to force redraw when the lineWidth changes.
    @IBInspectable
    var lineWidth: CGFloat = 3 { didSet {setNeedsDisplay() } }
    @IBInspectable
    var fillColor: UIColor = UIColor.greenColor() { didSet { setNeedsDisplay() } }
    @IBInspectable
    var borderColor: UIColor = UIColor.blackColor() { didSet { setNeedsDisplay() } }
    @IBInspectable
    var scale: CGFloat = 0.9 { didSet { setNeedsDisplay() } }
    
    var faceCenter: CGPoint {
        return convertPoint(center, fromView: superview)
    }
    
    var radius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    override func drawRect(rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: faceCenter, radius: radius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        circlePath.lineWidth = lineWidth
        borderColor.set()
        circlePath.stroke()
        fillColor.set()
        circlePath.fill()
    }

}
