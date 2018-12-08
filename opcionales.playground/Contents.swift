import UIKit


//: Opcionales
var possibleNumber : String = "123"
var convertedNumber : Int? = Int(possibleNumber)
possibleNumber = "abc"
convertedNumber = Int(possibleNumber)

if (convertedNumber == nil)
{
    print("el numero convertido es nil")
}
print("el programa ha terminado!")
