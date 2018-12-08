import UIKit

//////////////////////////////////////////////////////////////////
//: Manipulación de Strings
//////////////////////////////////////////////////////////////////
var strMut : String = ""
strMut = "mi string mutable"
strMut = "editando el string"

let strNoMut : String = "mi string no mutable"
// strNoMut = "esto no es un string mutable" // error

//////////////////////////////////////////////////////////////////
// Declaración de tipo en forma explicita.
//////////////////////////////////////////////////////////////////
let myExplicitValue : String = "My Weight is"
let myExplicitValue2 : Double = 70

// Declaración de tipo en forma Implícita.
let myImplicitValue = "My Weight is: "

// Para incluir una variable (no String) dentro de un String utiliza \().
let yourWeight = "Your weight is \(myExplicitValue2)"

// Los Strings no permiten la conversión implícita de tipo de dato.
let myWeight = myImplicitValue + String(myExplicitValue2)

print("myWeieght tiene valir de: \(myWeight)")

print("variables de valor: " + yourWeight)


////////////////////////////////////////////////////////////////
//: Uso de indices en los Strings
////////////////////////////////////////////////////////////////
var str = "Hello, playground"

str.insert("¡", at: str.startIndex)
str.insert("!", at: str.endIndex)
str.insert("s", at: str.index(before: str.endIndex))
str.insert(contentsOf: " guys", at: str.index(before: str.endIndex))

// Concatenación de Strings
print("\n..." + str)
print("Esto es: \(str)")


//////////////////////////////////////////////////
// string management
//////////////////////////////////////////////////
var welcome : String = "Bienvenido a todas"
welcome.insert(contentsOf: " las personas )"
    , at: welcome.endIndex)
welcome.insert(contentsOf: "!", at: welcome.index(after: welcome.startIndex))

print("El valor de welcome es: \(welcome)")

