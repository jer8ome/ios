//
//  ViewController.swift
//  homework_10th
//
//  Created by jerome on 2018/11/28.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [ weak weakSelf = self](mytimer) in
            weakSelf?.myView.center.x += 20
        })
    }

    @IBAction func bentClicked(_ sender: Any) {
        timer?.invalidate()

        UIView.animate(withDuration: 4, delay: 1, options: [.curveEaseInOut,.autoreverse,.repeat], animations: {
            self.myView.alpha = 0
            self.myView.center.x = self.view.bounds.width
            self.myView.backgroundColor = UIColor.orange
            //transform
            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)   //旋转缩小
        }) { (finished) in
            if finished {
                self.myView.removeFromSuperview()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

