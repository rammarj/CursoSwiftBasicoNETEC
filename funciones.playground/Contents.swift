import UIKit

func greet(_ person: String, on day: String) -> String{
    return "Hello \(person) today is \(day)"
}

greet("Salvador", on: "Monday")
// Hello Salvador today is Monday


func greet2(_ person: String = "guy", on day: String) {
    print("Hello \(person) today is \(day)!")
}

var greeting : () = greet2(on: "friday")
greeting = greet2("Roger", on:"saturday")

var greeting2 : (String,String) -> () = greet2
greeting2("Roger","sunday")


func addTwoNum(a:Int,b:Int) -> Int{
    return a+b
}

func substracTwoNum(a:Int,b:Int) -> Int{
    return a-b
}

func multiplyTwoNum(a:Int,b:Int) -> Int{
    return a*b
}

func modulusNum(a:Int,b:Int) -> Int{
    return a%b
}

func divideTwoNum(a:Int,b:Int) -> Int{
    if (b == 0){
        return 0
    }
    return a/b
}

func printMathResult(operation: (Int,Int) -> Int,a: Int,b: Int) -> Void{
    print("Result: \(operation(a,b))")
}

print("\n\nOperaciones matematicas - calculadora")
printMathResult(operation: addTwoNum, a: 2, b: 3)
printMathResult(operation: substracTwoNum, a: 2, b: 3)
printMathResult(operation: multiplyTwoNum, a: 2, b: 3)
printMathResult(operation: divideTwoNum, a: 2, b: 3)
printMathResult(operation: modulusNum, a: 2, b: 3)

func x (a: Int, b: String) -> String {
    return ("\(b) \(a)")
}

print(x(a: 2, b: "Yo tengo: "))
