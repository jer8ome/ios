//: Playground - noun: a place where people can play

let MAX_NUM = 10000//设置常量10000
var isPrime = true
var num = 1
var array = [Int]()//定义Int型数组
//用循环的方法找出10000以内所有质数，并存入数组array
while(num<MAX_NUM){
    num += 1
    for i in 2..<num {
        if(num % i == 0){
            isPrime = false
            break
        }
    }
    if isPrime{
        array.append(num)
    }
    isPrime = true
}
//正向排序
array = array.sorted()
print(array)

//五种数组逆序方法
//方法一
let array1 = array.sorted { (s1, s2) -> Bool in
    return s1 > s2
}
print(array1)

//方法二
let array2 = array.sorted{$0>$1}
print(array2)

//方法三
let array3 = array.sorted(by: {(s1,s2) in return s1 > s2})
print(array3)

//方法四
let array4 = array.sorted(by: {s1,s2 in s1 > s2})
print(array4)

//方法五
let array5 = array.sorted(by: >)
print(array5)


