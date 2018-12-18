//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class MyView:UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.close()
        UIColor.green.setFill()
        path.fill()
    }
}

class Controller: UIViewController{
    var label: UILabel?
    var triangle: MyView?
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.orange
        
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label?.backgroundColor = UIColor.blue
        label?.textColor = UIColor.white
        label?.textAlignment = .center
        label?.text = "Hello World!"
        
        view.addSubview(label!)
        
        let imageurl = URL(string: "http://seopic.699pic.com/photo/50077/7412.jpg_wh1200.jpg")!
        let data = try! Data(contentsOf: imageurl)
        let image = UIImage(data: data)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 400, height: 400))
        imageView.image = image
        view.addSubview(imageView)
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 50))
        button.setTitle("Click Me", for: UIControl.State.normal)
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(Controller.clicked), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        //添加一个绿色三角形
        triangle = MyView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        triangle?.backgroundColor = UIColor.clear
        view.addSubview(triangle!)
    } 
    @IBAction func clicked() {
        print("I am clicked!")
        label?.text = "I am clicked!!!"
        UIView.animate(withDuration: 1){
            self.triangle?.center = CGPoint(x: self.view.bounds.width/2, y: 0)
        }
    }
}
let controller = Controller()
PlaygroundPage.current.liveView = controller


