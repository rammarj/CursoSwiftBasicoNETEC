import UIKit

//: Clases y Estructuras
// En el siguiente ejemplo se puede apreciar la herencia a partir de la clase MediaItem.

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
    
}

struct Item {
    var name : String
}

struct Peli {
    var name : String
    var director : String
}

struct Canc {
    var name : String
    var artist : String
}

var mymovie = Movie(name: "Jumper", director: "Joaquin el don vergs")
var mySong = Song(name: "As if it your last", artist: "BlackPink")
var peli = Peli.init(name: "El renacido", director: "Gonzalez iñárritu")


var car = Peli(name: "", director: "")
