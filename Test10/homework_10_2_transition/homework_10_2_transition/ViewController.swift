//
//  ViewController.swift
//  homework_10_2_transition
//
//  Created by jerome on 2018/11/28.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    var isHide = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func changeView(_ sender: Any) {
        
        isHide = true
        
        //切换子视图
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        imageView.image = UIImage(named: "image")
        UIView.transition(from: myView, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
        
    }
    
    
    @IBAction func btnCLicked(_ sender: Any) {
        
        if !isHide {
            //改变颜色
            UIView.transition(with: myView, duration: 2, options: .transitionFlipFromLeft, animations: {
                self.myView.backgroundColor = UIColor.green
            }, completion: nil)
        }
    }
}

