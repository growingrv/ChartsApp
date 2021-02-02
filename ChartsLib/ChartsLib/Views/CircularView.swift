//
//  CircularView.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 02/02/21.
//

import UIKit

class CircularView: UIView{

    var percent: Double = 0.0
    var lineColor: UIColor?
    var lineWidth = 3.0
    var backgroundLineColor: UIColor?
    var backgroundLineWidth = 3.0
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: super.topAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0).isActive = true

        drawCircularContainerView(lineWidth: CGFloat(backgroundLineWidth), lineColor: backgroundLineColor ?? .lightGray)

        if percent > 0 {
            percent = min(100, percent)
            drawCircularView(lineWidth: CGFloat(lineWidth),
            lineColor: lineColor ?? .blue, percent: CGFloat(percent))
        }
    }
    
    func drawCircularContainerView(lineWidth: CGFloat, lineColor: UIColor) {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = lineWidth
        let startAngle = CGFloat(90.0).toRadians()
        let endAngle = CGFloat(0.0).toRadians()
        let circlePath = UIBezierPath (
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        let shapeBackLayer = CAShapeLayer()
            shapeBackLayer.path = circlePath.cgPath
            shapeBackLayer.fillColor = UIColor.clear.cgColor
            shapeBackLayer.strokeColor = lineColor.cgColor
            shapeBackLayer.lineWidth = desiredLineWidth
            shapeBackLayer.lineCap = .square
        layer.addSublayer(shapeBackLayer)
    }

    func drawCircularView(lineWidth: CGFloat, lineColor: UIColor, percent: CGFloat) {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = lineWidth
        let startAngle = CGFloat(90.0).toRadians()
        let maxEndAngle = CGFloat(360.0).toRadians()
        let percentNew = percent/100
        let endAngle = startAngle + (maxEndAngle - startAngle) * percentNew
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:halfSize, y:halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = lineColor.cgColor
            shapeLayer.lineWidth = desiredLineWidth
            shapeLayer.lineCap = .square
        layer.addSublayer(shapeLayer)
    }

    func animateCircle(duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        shapeLayer.strokeEnd = 1.0
        shapeLayer.add(animation, forKey: "animateCircle")
    }
}
