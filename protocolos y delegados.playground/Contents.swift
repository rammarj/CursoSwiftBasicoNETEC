import UIKit

//: Protocolos y Delegados

class City {
    let name : String?
    let population : Int?
    
    init(name:String,population:Int) {
        self.name = name
        self.population = population
        print("Welcome to \(self.name), our population is \(self.population) habitants.")
    }
    
    func showAllInfo() -> String{
        if self.name != nil && self.population != nil {
            return "City: \(self.name), Population: \(self.population)"
        }else{
            return "No data!"
        }
    }
}

protocol coordinates {
    func latitude(_ val:Double)
    func longitude(_ val:Double)
}

class Coordinates : City, coordinates {
    internal func longitude(_ val: Double) {
        print("Longitude in \(self.name) is equals to \(val) degrees.")
    }
    
    internal func latitude(_ val: Double) {
        print("Latitud in \(self.name) is equals to \(val) degrees.")
    }
}

let cdmx = Coordinates.init(name: "Ciudad de México", population: 8_918_653)
cdmx.latitude(123)
cdmx.longitude(321)
