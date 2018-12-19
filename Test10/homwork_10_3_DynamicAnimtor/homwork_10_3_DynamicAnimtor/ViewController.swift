//
//  ViewController.swift
//  homwork_10_3_DynamicAnimtor
//
//  Created by jerome on 2018/11/28.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backView: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    
    let gravity = UIGravityBehavior()       //重力相关
    let collision = UICollisionBehavior()   //碰撞相关
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        collision.translatesReferenceBoundsIntoBoundary = true
    }


    @IBAction func add(_ sender: Any) {
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        label.backgroundColor = UIColor.red
        label.text = "J"
        label.textAlignment = .center
        backView.addSubview(label)
        
        gravity.addItem(label)
        collision.addItem(label)
    }
    
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        for item in backView.subviews {
            if item is UILabel {
                item.removeFromSuperview()
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
}

