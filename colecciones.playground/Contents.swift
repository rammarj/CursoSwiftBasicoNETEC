import UIKit
import Foundation

var myArray = [Int]()
var opcion : [Int] = []
var opciones1 : [Int] = [10, 26, 34, 48]
var opcionesA : [String] = ["diez", "veinte", "treinta"]


opciones1.insert(2, at: opciones1.endIndex)
opciones1.append(100)
opciones1.insert(140, at: opciones1.startIndex)
//print(opciones1)

var arregloArray : Array<Int> = [1, -2, -4, 2, 3, 4, 5, 6, 7]
arregloArray.removeLast()
arregloArray.removeFirst()
arregloArray.remove(at: 0)
print(arregloArray)

print("\n\n\n arreglo ")
print(opciones1)
for _ in 1...opciones1.count {
    opciones1.append(opciones1.remove(at: 0))
    print(opciones1)
}
