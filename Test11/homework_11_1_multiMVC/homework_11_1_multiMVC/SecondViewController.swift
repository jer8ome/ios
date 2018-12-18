//
//  SecondViewController.swift
//  homework_11_1_multiMVC
//
//  Created by jerome on 2018/12/15.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var no = ""
    var name = ""
    var stu:Student!
    
    var delegate:StudentProtocol?

    @IBOutlet weak var stuNumber: UITextField!
    @IBOutlet weak var stuName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        stuNumber.text = no
//        stuName.text = name
        stuNumber.text = stu.no
        stuName.text = stu.name
    }
    
    
    @IBAction func back(_ sender: Any) {
//        no = stuNumber.text!
//        name = stuName.text!
        
        //第三种方法 共享moudle
        stu.no = stuNumber.text!
        stu.name = stuName.text!
        
        //第一种方法 但是不符合MVC，难以重用
//        for vc in self.navigationController!.viewControllers{
//            if let firstVC = vc as? FirstViewController{
//                    firstVC.no = no
//                    firstVC.name = name
//            }
//        }
        
        //第二种方法。协议protocol
//        delegate?.change(no: no, name: name)
        
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
