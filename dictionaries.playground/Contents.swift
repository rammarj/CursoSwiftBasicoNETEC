import UIKit

//var myDictionary1 : [String:String] = []
var dic : [Int:String] = [1:"A",2:"B",3:"C"]
var dicA : [String:String] = ["1":"A","2":"B","3":"C"]

let myScores = ["English":8, "Chemistry":7, "Physics":9, "Biology":7]

for _ in myScores {
    print(myScores.keys)
}

for (subject, score) in myScores{
    print("My score in \(subject) is \(score)")
}

myScores["English"]
