//
//  ViewController.swift
//  MultiThreadDemo
//
//  Created by Jerome on 2018/12/17.
//  Copyright © 2018年 jerome. All rights reserved.
//

//代码块放子线程，界面放主线程



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sumlable: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer) in
            self.count+=1
            print("Timer Thread:\(Thread.current)")
            self.countLabel.text = "count:\(self.count)"
        }
    }

    @IBAction func sum(_ sender: Any) {
        var sum = 0
        
        DispatchQueue.global().async {
            print("sum Thread:\(Thread.current)")
            for i in 1...99999999{
                sum+=i
            }
            DispatchQueue.main.async {
                self.sumlable.text = "\(sum)"
            }
        }
        
        
    }
    
}

