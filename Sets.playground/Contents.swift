import UIKit

var mySet = Set<Character>()
var conjunto : Set<String> = []
var conjuntoA : Set<String> = ["alumno", "profesor", "secretaria", "delegado"]
var conjuntoB : Set<String> = ["conserje", "director", "profesor"]

print("interseccion: \(conjuntoA.intersection(conjuntoB))")
print("symetricDifference: \(conjuntoA.symmetricDifference(conjuntoB))")
print("union: \(conjuntoA.union(conjuntoB))")
print("substracting: \(conjuntoA.subtracting(conjuntoB))")



////

var elementsA: Set<String> = ["a", "b", "c", "d", "e"]
var elementsB: Set<String> = ["a", "b", "f", "g", "h", "u", "v"]
var elementsC: Set<String> = ["h", "g", "j", "t", "v"]
var elementsD: Set<String> = ["j", "k", "l", "m", "a", "z"]

print("\n1. Union D y A")
print(elementsD.union(elementsA))
print("\n2. Union C y B")
print(elementsC.union(elementsB))
print("\n3. ¿Cuales son los elementos comunes de A y B?")
print(elementsA.intersection(elementsB))
print("\n4. ¿Cuales son los elementos diferentes de C y D?")
print(elementsC.symmetricDifference(elementsD))
print("\n5. ¿Cuales son los elementos de B que estan en C?")
print(elementsB.intersection(elementsC))
print("\n6. ¿Cuales son los elementos de C que no estan en D?")
print(elementsC.subtracting(elementsD))
print("\n7. ¿Cuales son los elementos de A que no estan en B?")
print(elementsA.subtracting(elementsB))
print("\n8. ¿Existen valores en comun entre A y D?")
print(elementsA.intersection(elementsD))
print("\n9. ¿Existen valores en comun entre C y B?")
print(elementsC.intersection(elementsB))

