//: Playground - noun: a place where people can play

import UIKit

//1.    显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
//a)    显示中文需要设置locale

let now = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年M月d日 EEEE aa HH:mm"
dateFormatter.locale = Locale.current
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let BeiJing = dateFormatter.string(from: now)
print("北京时间：\(BeiJing)")
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let Tokyo = dateFormatter.string(from: now)
print("东京时间：\(Tokyo)")
dateFormatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let NewYork = dateFormatter.string(from: now)
print("纽约时间：\(NewYork)")
dateFormatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
let London = dateFormatter.string(from: now)
print("伦敦时间：\(London)")

//2.    处理字符串
//a)    新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；
//b)    返回字符串从第6个字符到第20个字符的子串；
//c)    删除其中所有的OS字符；

var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let substr = str[str.index(str.startIndex, offsetBy: 6)..<str.index(str.startIndex, offsetBy: 21)]
print(substr)
str.removeSubrange(str.range(of: "OS")!)

//3.    将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
var dic = [["time":BeiJing,"string":str],["time":Tokyo,"string":str],["time":NewYork,"string":str],["time":London,"string":str]]as AnyObject
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
url.appendPathComponent("test.txt")
dic.write(toFile:url.path,atomically:true)
print(url.path)
let kk = NSDictionary(contentsOf: url)
print(kk as Any)

//4.    从网上下载一张照片并保存到本地沙盒的Document的某文件中；
let imageUrl = URL(string:"http://picm.photophoto.cn/111/054/012/0540120079.jpg")!
let imageData = try! Data(contentsOf: imageUrl)
let image = UIImage(data: imageData)
var imageLocalUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
imageLocalUrl.appendPathComponent("test.jpg")
try? imageData.write(to: imageLocalUrl)



