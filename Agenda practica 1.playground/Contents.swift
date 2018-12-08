import UIKit

class Persona {
    var nombre : String = ""
    var fechaNac : Date
    var domicilio : String
    var correo : String
    
    init(nombre : String, fechaNac : String, domicilio : String, correo : String) {
        self.nombre = nombre
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.fechaNac = formatter.date(from: fechaNac)!
        self.domicilio = domicilio
        self.correo = correo
    }
    
    func calcularFechaNacimiento() -> Int {
        let a = Calendar.current.dateComponents([.year],
                                                from: fechaNac,
                                                to: Date())
        return a.year!
    }
}

// Specify date components

var pe = Persona(nombre: "joaquin", fechaNac : "27/01/1996", domicilio : "domicilio", correo: "correo")
    print(pe.calcularFechaNacimiento())


class Contacto {
    
}

class Evento {
    
}

