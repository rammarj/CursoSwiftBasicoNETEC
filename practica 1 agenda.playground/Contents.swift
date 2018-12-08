import UIKit

class Persona {
    var nombre : String
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

class Contacto : Persona {
    
    private var empresa : String
    private var parentesco : String
    private var telefono : String
    
    init(nombre: String, fechaNac: String, domicilio: String, correo: String, empresa: String, parentesco : String, telefono : String) {
        self.empresa = empresa
        self.parentesco = parentesco
        self.telefono = telefono
        super.init(nombre: nombre, fechaNac: fechaNac, domicilio: domicilio, correo: correo)
    }
    
    func toString() -> String {
        return "Nombre: \(self.nombre), Empresa: \(self.empresa), parentezco: \(self.parentesco)"
    }
    
}

class Evento {
    
    private var fecha : Date
    private var contactos : Array<Contacto>
    private var identificador : String
    private var descripcion : String
    
    init(identificador : String, fecha: String, descripcion : String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:00"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        self.fecha = formatter.date(from: fecha)!
        self.contactos = Array<Contacto>()
        self.identificador = identificador
        self.descripcion = descripcion
    }
    
    func agregarContacto(contacto : Contacto) -> Void {
        self.contactos.append(contacto)
    }
    
    func obtenerContacto(nombre : String) -> Contacto? {
        return self.contactos.first { (c) -> Bool in
            return c.nombre == nombre
        }
    }
    
    func eliminarContacto(nombre : String) -> Void {
        self.contactos.removeAll { (c) -> Bool in
            return c.nombre == nombre
        }
    }

    func obtenerIdentificador() -> String {
        return self.identificador
    }
    
    func obtenerContactos() -> Array<Contacto> {
        return self.contactos
    }
    
    func obtenerDescripcion() -> String {
        return self.descripcion
    }
    
    func toString() -> String {
        var s = "Identificador: \(self.identificador), descripcion: \(self.descripcion), fecha: \(self.fecha) \nContactos:\n"
        self.contactos.forEach { (c) in
            s += "* " + c.toString() + "\n"
        }
        return s
    }
    
    func obtenerFecha() -> Date {
        return self.fecha
    }
}

class Agenda {
    private var contactos : Array<Contacto>
    private var eventos : Array<Evento>
    
    init() {
        self.contactos = Array<Contacto>()
        self.eventos = Array<Evento>()
    }
    
    func agregarContacto(contacto : Contacto) -> Void {
        self.contactos.append(contacto)
    }
    
    func eliminarContacto(nombre : String) -> Void {
        self.contactos.removeAll { (c) -> Bool in
            return c.nombre == nombre
        }
        // eliminar en los eventos tambien
        self.eventos.forEach { (e) in
            e.eliminarContacto(nombre: nombre)
        }
    }
    
    func obtenerContactos() -> Array<Contacto> {
        return self.contactos
    }
    
    func obtenerContacto(nombre : String) -> Contacto? {
        return self.contactos.first { (c) -> Bool in
            return c.nombre == nombre
        }
    }
    
    func agregarEvento(idEvento : String, fecha : String, descripcion : String) -> Void {
        self.eventos.append(Evento(identificador: idEvento, fecha: fecha, descripcion: descripcion))
    }
    
    func agregarEvento(evento : Evento) -> Void {
        var e = self.obtenerEvento(identificador: evento.obtenerIdentificador())
        if let e1 = e {
            // nothing - ya esta agregado
        }
        else {
            var f = self.obtenerEventoEnFecha(d: evento.obtenerFecha())
            if let ee = f {
                // no colision de eveentos por fechas
            }
            else {
                self.eventos.append(evento)
            }
        }
        
    }
    
    func obtenerEventoEnFecha(d : Date) -> Evento? {
        return self.eventos.first { (e) -> Bool in
            return e.obtenerFecha() == d
        }
    }
    
    func eliminarEvento(identificador : String) -> Void {
        self.eventos.removeAll { (c) -> Bool in
            return c.obtenerIdentificador() == identificador
        }
    }
    
    func obtenerEvento(identificador : String) -> Evento? {
        return self.eventos.first { (c) -> Bool in
            return c.obtenerIdentificador() == identificador
        }
    }
    
    func agregarContactoAEvento(identificadorEvento : String, nombreContacto : String) -> Void {
        var evento : Evento? = self.obtenerEvento(identificador: identificadorEvento)
        if let e = evento {
            var contacto : Contacto? = self.obtenerContacto(nombre: nombreContacto)
            if let c = contacto {
                var eA = evento?.obtenerContacto(nombre: nombreContacto)
                if let c1 = eA {
                    // nothing
                }else {
                    evento!.agregarContacto(contacto: contacto!)
                }
            }
        }
    }
    
    func toString() -> String {
        var s = ""
        self.eventos.forEach { (e) in
            s += "- Evento -\n" + e.toString() + "\n"
        }
        return s
    }
}


/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// program /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

// objetos contacto
var joaquin = Contacto(nombre: "Joaquin", fechaNac: "27/01/1996", domicilio: "4ta Seccion Miguel Hidalgo, Tlalpan, CDMX",
                       correo: "joaquin.ramirez.mtz.lab@gmail.com", empresa: "Grupo Salinas", parentesco: "Myself", telefono: "12345675413")

var rosa_elena = Contacto(nombre: "Rosa", fechaNac: "01/10/1991", domicilio: "Pachuca de Soto, Hidalgo",
                          correo: "abdany07@hotmail.com", empresa: "Central de Autobuses ADO", parentesco: "Hermana", telefono: "12345675413")

var leticia = Contacto(nombre: "Leticia", fechaNac: "10/05/1999", domicilio: "",
                       correo: "letyram@hotmail.com", empresa: "Grupo Salinas", parentesco: "Hermana", telefono: "12345675413")

var griselda = Contacto(nombre: "Griselda", fechaNac: "30/12/1998", domicilio: "Santaa Catarina, Monterrey",
                       correo: "grisvillalva010@gmail.com", empresa: "Fuerza Civil de Nuevo Leon", parentesco: "Novia", telefono: "12345675413")

var christian = Contacto(nombre: "Christian", fechaNac: "09/03/1984", domicilio: "4ta Seccion Miguel Hidalgo, Tlalpan, CDMX",
                       correo: "chrismondrag@gmail.com", empresa: "", parentesco: "amigo", telefono: "12345675413")

var julio = Contacto(nombre: "Julio", fechaNac: "04/07/1978", domicilio: "Huautla, Hidalgo",
                       correo: "", empresa: "", parentesco: "padre", telefono: "12345675413")

// objeto agenda
var agenda = Agenda()
agenda.agregarContacto(contacto: joaquin)
agenda.agregarContacto(contacto: rosa_elena)
agenda.agregarContacto(contacto: leticia)
agenda.agregarContacto(contacto: griselda)
agenda.agregarContacto(contacto: christian)
agenda.agregarContacto(contacto: julio)

// objetos evento
var evento1 = Evento(identificador: "rca", fecha: "27/01/2019 12:00", descripcion : "reunion con amigo y padre")
agenda.agregarEvento(evento: evento1)
agenda.agregarContactoAEvento(identificadorEvento: "rca", nombreContacto: "Joaquin")
agenda.agregarContactoAEvento(identificadorEvento: "rca", nombreContacto: "Christian")
agenda.agregarContactoAEvento(identificadorEvento: "rca", nombreContacto: "Julio")

var evento2 = Evento(identificador: "rca2", fecha: "27/01/2019 13:00", descripcion : "reunion con hermanas")
agenda.agregarEvento(evento: evento2)
agenda.agregarContactoAEvento(identificadorEvento: "rca2", nombreContacto: "Joaquin")
agenda.agregarContactoAEvento(identificadorEvento: "rca2", nombreContacto: "Leticia")
agenda.agregarContactoAEvento(identificadorEvento: "rca2", nombreContacto: "Rosa")


var evento3 = Evento(identificador: "rca3", fecha: "27/01/2019 14:00", descripcion : "reunion con mi hermana y amigo")
agenda.agregarEvento(evento: evento3)
agenda.agregarContactoAEvento(identificadorEvento: "rca3", nombreContacto: "Joaquin")
agenda.agregarContactoAEvento(identificadorEvento: "rca3", nombreContacto: "Christian")
agenda.agregarContactoAEvento(identificadorEvento: "rca3", nombreContacto: "Rosa")


var evento4 = Evento(identificador: "rca4", fecha: "27/01/2019 15:00", descripcion : "reunion familiar")
agenda.agregarEvento(evento: evento4)
agenda.agregarContactoAEvento(identificadorEvento: "rca4", nombreContacto: "Joaquin")
agenda.agregarContactoAEvento(identificadorEvento: "rca4", nombreContacto: "Rosa")
agenda.agregarContactoAEvento(identificadorEvento: "rca4", nombreContacto: "Julio")


var evento5 = Evento(identificador: "rca5", fecha: "27/01/2019 16:00", descripcion : "presentar novia a mi padre")
agenda.agregarEvento(evento: evento5)
agenda.agregarContactoAEvento(identificadorEvento: "rca5", nombreContacto: "Joaquin")
agenda.agregarContactoAEvento(identificadorEvento: "rca5", nombreContacto: "Griselda")
agenda.agregarContactoAEvento(identificadorEvento: "rca5", nombreContacto: "Julio")

print("Lista de contactos existentes")
agenda.obtenerContactos().forEach { (c) in
    print(c.toString())
}

//agenda.eliminarContacto(nombre: "Christian")
print("\nAgenda: ")
print(agenda.toString())
