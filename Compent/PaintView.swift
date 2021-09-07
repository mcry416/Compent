//
//  PaintView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/27.
//

import UIKit

class PaintView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        myDrawShadow()
    }
    
    func myDrawLineAndRect(){
        let myRect = self.bounds.insetBy(dx: (self.bounds.size.width * 0.05), dy: (self.bounds.size.width * 0.05))
        
        let pointOfTopLeft =     CGPoint(x: myRect.minX, y: myRect.minY)
        let pointOfTopRight =    CGPoint(x: myRect.maxX, y: myRect.minY)
        let pointOfBottomLeft =  CGPoint(x: myRect.minX, y: myRect.maxY)
        let pointOfBottomRight = CGPoint(x: myRect.maxX, y: myRect.maxY)
        let pointOfCenter =      CGPoint(x: myRect.midX, y: myRect.midY)
        let pointOfTest =        CGPoint(x: (myRect.midX * 1.3), y: (myRect.midY * 1.3))
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: pointOfTopLeft)
        bezierPath.addLine(to: pointOfBottomLeft)
        bezierPath.addLine(to: pointOfBottomRight)
        bezierPath.addLine(to: pointOfTopRight)
    //    bezierPath.addCurve(to: pointOfTopRight, controlPoint1: pointOfCenter, controlPoint2: pointOfTest)
        bezierPath.lineWidth = 5
        bezierPath.lineJoinStyle = .round
        
        bezierPath.close()
        
      //  UIColor.orange.setFill()
        UIColor.red.setStroke()
     //   bezierPath.fill()
        bezierPath.stroke()
    }
    
    func myDrawCurve(){
        let myRect = self.bounds.insetBy(dx: (self.bounds.size.width * 0.05), dy: (self.bounds.size.width * 0.05))
        
        let pointOfTopLeft =     CGPoint(x: myRect.minX, y: myRect.minY)
        let pointOfTopRight =    CGPoint(x: myRect.maxX, y: myRect.minY)
        let pointOfBottomLeft =  CGPoint(x: myRect.minX, y: myRect.maxY)
        let pointOfBottomRight = CGPoint(x: myRect.maxX, y: myRect.maxY)
        let pointOfCenter =      CGPoint(x: myRect.midX, y: myRect.midY)
        let pointOfTest =        CGPoint(x: (myRect.midX * 1.3), y: (myRect.midY * 1.3))
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: pointOfTopLeft)

        bezierPath.addCurve(to: pointOfBottomLeft, controlPoint1: pointOfCenter, controlPoint2: pointOfTest)
        
        bezierPath.lineWidth = 5
        bezierPath.lineJoinStyle = .round
   
        UIColor.orange.setFill()
        UIColor.black.setStroke()

        bezierPath.stroke()
    }
    
    func myDrawCircle(){
        let myRect = self.bounds.insetBy(dx: (self.bounds.size.width * 0.05), dy: (self.bounds.size.width * 0.05))
        
        let pointOfCenter = CGPoint(x: myRect.midX, y: myRect.midY)
        
        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: pointOfCenter, radius: 100, startAngle: 0, endAngle: (2 * CGFloat(Double.pi)), clockwise: true)
        bezierPath.lineWidth = 2
        bezierPath.close()
        
   //     UIColor.black.setFill()
        UIColor.green.setStroke()
  //      bezierPath.fill()
        bezierPath.stroke()
    }
    
    func myDrawRealRect(){
        let rect = CGRect(x: 0, y: 0, width: 80, height: 100)
        
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: 10)

        bezierPath.lineWidth = 5
        bezierPath.lineJoinStyle = .round
        
        UIColor.orange.setFill()
        UIColor.green.setStroke()
        bezierPath.fill()
        bezierPath.stroke()
    }
    
    func myDrawArc(){
        let myRect = self.bounds.insetBy(dx: (self.bounds.size.width * 0.05), dy: (self.bounds.size.width * 0.05))
        
        let pointOfCenter = CGPoint(x: myRect.midX, y: myRect.midY)
        
        let bezierPath = UIBezierPath()
        
        bezierPath.addArc(withCenter: pointOfCenter, radius: 100, startAngle: (0.3 * CGFloat(Double.pi)), endAngle: (1.2 * CGFloat(Double.pi)), clockwise: true)
        bezierPath.lineWidth = 2
    //    bezierPath.close()
        
   //     UIColor.black.setFill()
        UIColor.black.setStroke()
  //      bezierPath.fill()
        bezierPath.stroke()
    }

    func myDrawShadow(){
        let context = UIGraphicsGetCurrentContext()
        
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        
        context!.saveGState()
        
        let shadowColor = UIColor.black.cgColor
        let shadowOffset = CGSize(width: 5, height: 5)
        let shadowBlurRadius: CGFloat = 5.0
        
        context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadowColor)
        
        UIColor.systemOrange.setFill()
        bezierPath.fill()
        
        context!.restoreGState()
    }
    
}
