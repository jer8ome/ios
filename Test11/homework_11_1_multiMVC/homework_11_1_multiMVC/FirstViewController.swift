//
//  ViewController.swift
//  homework_11_1_multiMVC
//
//  Created by jerome on 2018/12/15.
//  Copyright © 2018年 jerome. All rights reserved.
//

import UIKit

protocol StudentProtocol {
    func change(no:String,name:String)
}

class FirstViewController: UIViewController,StudentProtocol {
    func change(no: String, name: String) {
        self.name = name
        self.no = no
    }
    
    
    var no = ""
    var name = ""
    var stu = Student()

    @IBOutlet weak var stuNumber: UITextField!
    @IBOutlet weak var stuName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        stuNumber.text = no
//        stuName.text = name
        stuNumber.text = stu.no
        stuName.text = stu.name

    }


    @IBAction func showSecondVC(_ sender: Any) {
        
//        no = stuNumber.text!
//        name = stuName.text!
        stu.no = stuNumber.text!
        stu.name = stuName.text!
        
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second") as! SecondViewController
        
//        secVC.no = no
//        secVC.name = name
        secVC.no = stu.no
        secVC.name = stu.name
        secVC.stu = stu
        secVC.delegate = self
        
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    @IBAction func showThirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Third")
        present(thirdVC, animated: true, completion: nil)
    }
    
}

