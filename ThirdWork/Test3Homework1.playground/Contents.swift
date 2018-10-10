//: Playground - noun: a place where people can play

import UIKit

//(1)给定一个Dictionary数组，Dictionary包含key值name和key值age，用map函数返回name字符串数组

let dictArray:[[String:Any]] = [["name":"Mr Li","age":43],["name":"Mr Gao","age":42],["name":"Mrs Li","age":37]]
var arr = dictArray.map{$0["name"]}
print(arr)
//map函数传参要传齐
//let maps = dict.map({
//    (key: String,values: Int) -> String in
//    return key
//})

//（2）  给定一个String数组，用filter函数选出能被转成Int的字符串

let strs = ["jiyt","123","1j23","18u"]
//filter返回值是布尔值，符合要求则不过滤，
//比如本例，不为空为true则不过滤
let filters = strs.filter{
    (str) -> Bool in
        return (Int(str) != nil)
}
print(filters)
//（3） 用reduce函数把String数组中元素连接成一个字符串，以逗号分隔

//let reduces = strs.reduce("", combine:+)
var reduces = strs.reduce(""){
    text,name in "\(text)\(name),"
}
reduces.removeLast()
print(reduces)

//（4）  用 reduce 方法一次求出整数数组的最大值、最小值、总数和

let arrays = [1,3,1,1,1,5,1]
let tuple = arrays.reduce((max:arrays[0], min:arrays[0],sum:0)){
    (max($0.max,$1),min($0.min,$1),$0.sum+$1)
}
print(tuple)

//（5）新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；

func one()->Int{
    return 1
}

func two(num:Int)->Int{
    return 2
}

func three()->Void{
    print("()->Void")
}

func four(num:Int)->Void{
    print("Int->Void")
}

var funcs:[Any] = [one,two,three,four]
for(key,value) in funcs.enumerated(){
    if value is (Int)->Int{
        print("find it,key is \(key)")
    }
}

//（6）扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；

extension Int{
    func Sqrt() -> Double{
        return sqrt(Double(self))
    }
}

//（7） 实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
func powerfulFunc<T:Comparable>(a:T...)->(T,T){
    return a.reduce((max:a[0],min:a[0]), {(max($0.max,$1),min($0.min,$1))})
}






