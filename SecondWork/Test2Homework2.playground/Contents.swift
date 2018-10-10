//: Playground - noun: a place where people can play

//定义枚举类型 性别
enum Gender{
    case male,femal
}

//定义Person类
class Person:CustomStringConvertible{//继承CustomStringConvertible协议，才可print输出对象
    //存储属性
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{//计算属性
            get{
                return firstName + " " + lastName;
        }
    }
    //方法
    init(firstName:String,lastName:String//初始化
        ,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(){//方便初始化
        self.init(firstName: "firstName",lastName: "",age:18,gender: Gender.male)
    }
    //运算符重载
    static func == (left: Person, right: Person)->Bool{//两者相等的条件
        return left.firstName == right.firstName && left.lastName == right.lastName && left.age == right.age && left.gender == right.gender
    }
    static func != (lhs: Person, rhs: Person)->Bool{//不想等则相反
        return !(lhs == rhs)
    }
    //description
    var description:String{//定义直接print对象输出值
        get{
            return "fullName:\(self.fullName)\nage:\(self.age)\ngender:\(self.gender)\n"
        }
    }
    //get对象属性
    public func getFullName() -> String{//获取对象全名
        return fullName
    }
    public func getAge() -> Int{//获取对象年龄
        return age
    }
    public func getGender() -> Gender{//获取对象性别
        return gender
    }
}

//定义Teacher类
class Teacher : Person{//继承Person类
    var title:String
    
     init(firstName:String, lastName: String,age :Int,gender:Gender,title:String){//构造函数
        self.title = title;
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    override var description: String{//重载description
        get{
            return "fullname:\(getFullName())\nage:\(getAge())\ngender:\(getGender())\ntitle:\(title)\n"
        }
    }
}

//定义Student类
class Student:Person{//继承Person
    private var stuNo:Int
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:Int) {//构造函数
        self.stuNo = stuNo
            super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{//重载description
        get{
            return "fullname:\(getFullName())\nage:\(getAge())\ngender:\(getGender())\nstuNo:\(stuNo)\n"
        }
    }
}

//创建三个Person对象
let p1 = Person(firstName: "p1",lastName:"jackson",age:37,gender:Gender.male)
let p2 = Person(firstName: "p2",lastName:"jackson",age:34,gender:Gender.femal)
let p3 = Person(firstName: "p3", lastName: "jackson", age: 34, gender: Gender.male)

//创建三个Teacher对象
let t1 = Teacher(firstName: "me", lastName: "rf", age: 40, gender: Gender.femal, title: "PE")
let t2 = Teacher(firstName: "mr", lastName: "ch", age: 38, gender: Gender.male, title: "PC")
let t3 = Teacher(firstName: "mr", lastName: "x", age: 38, gender: Gender.male, title: "MA")

//创建三个Student对象
let s1 = Student(firstName: "st", lastName: "rf", age: 12, gender: Gender.femal, stuNo:22113)
let s2 = Student(firstName: "st", lastName: "cc", age: 14, gender: Gender.male, stuNo:25413)
let s3 = Student(firstName: "st", lastName: "am", age: 16, gender: Gender.femal, stuNo:29013)

//创建Person型对象数组
var personArray:Array = [Person]()
personArray.append(p1)
personArray.append(p2)
personArray.append(s3)
personArray.append(t1)
personArray.append(t2)

//统计Person，Teacher，Student对象个数
var personsNum:Int = 0
var teachersNum:Int = 0
var studentsNum:Int = 0
for person in personArray {
    if person is Teacher {
        teachersNum += 1
    }else if person is Student{
        studentsNum += 1
    }else{
        personsNum += 1
    }
}

//根据统计结果创建字典
let dict = ["personNum:":personsNum,"teacherNum:":teachersNum,"studentNum:":studentsNum]
//输出字典内容
print(dict)

//对象数组根据年龄排序
let array1 = personArray.sorted { ( p1:Person, p2:Person) -> Bool in
    return p1.age > p2.age
}

//对象数组根据全名排序
let array2 = personArray.sorted { (p1, p2) -> Bool in
    return p1.fullName > p2.fullName
}

//对象数组根据性别和年龄排序
let array3 = personArray.sorted { (p1, p2) -> Bool in
    return p1.gender.hashValue > p2.gender.hashValue && p1.age > p2.age
}

