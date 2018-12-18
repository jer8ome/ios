//
//  CircleView.swift
//  Gesture
//
//  Created by jerome on 2018/11/7.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    @IBInspectable var fillColor:UIColor?
    @IBInspectable var strokeColor:UIColor?

    func setup() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recongnizer:)))
        self.addGestureRecognizer(rotationRecognizer)
        
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 2
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            print("Double clicked")
        default:
            break
        }
    }
    
    @objc func pinch(recognizer: UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
            print("pinch")
        default:
            break
        }
    }
    
    @objc func pan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
            print("pan")
        default:
            break
        }
    }
    
    @objc func rotation(recongnizer: UIRotationGestureRecognizer){
        //print(recongnizer.rotation * (180 / CGFloat.pi))
        //手势旋转的弧度
        recongnizer.view?.transform = (recongnizer.view?.transform.rotated(by: recongnizer.rotation))!
        //将上次的弧度置为1
        recongnizer.rotation = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
//    Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }

}
