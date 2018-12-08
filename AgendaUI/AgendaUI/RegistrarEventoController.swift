//
//  RegistrarEventoController.swift
//  AgendaUI
//
//  Created by Macbook Pro A1990 on 12/7/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class RegistrarEventoController: UIViewController {

    // txt inputs
    @IBOutlet weak var txtIdentificador: UITextField!
    @IBOutlet weak var pkFecha: UIDatePicker!
    @IBOutlet weak var txtDescripcion: UITextField!
    @IBOutlet weak var pkContactosRelacionados: UIPickerView!
    @IBOutlet weak var tblContactosRelacionados: UITableView!
    
    
    // lbl errores
    @IBOutlet weak var lblErrorIdentificador: UILabel!
    @IBOutlet weak var lblErrorDescripcion: UILabel!
    @IBOutlet weak var lblErrorCR: UILabel!

    // auxiliares
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //limpiar labels
        self.lblErrorIdentificador.text = ""
        self.lblErrorDescripcion.text = ""
        self.lblErrorCR.text = ""
        
        self.pkFecha.datePickerMode = UIDatePicker.Mode.dateAndTime
        self.pkContactosRelacionados.dataSource = self
        self.pkContactosRelacionados.delegate = self
        self.tblContactosRelacionados.dataSource = self
    }
    
    @IBAction func btnAgregarContacto(_ sender: Any) {
        var q = pkContactosRelacionados.selectedRow(inComponent: 0)
        var valorSel = agenda.obtenerContactos()[q]
        contactosRelacionados.append(valorSel)
        self.tblContactosRelacionados.reloadData()
        //self.refresher.endRefreshing()
    }
    
    @IBAction func btnEliminar(_ sender: Any) {
        var q = tblContactosRelacionados.indexPathForSelectedRow
        if q != nil {
            //var valorSel = agenda.obtenerContactos()[q]
            contactosRelacionados.remove(at: q!.row)
            self.tblContactosRelacionados.reloadData()
        }
    }
    
    @IBAction func btnAgregarEvento(_ sender: Any) {
        let success = "Correcto"
        // falta validar el contacto relacionado
        
        // nombre
        var validaciones = [Validador.validar(lbl: lblErrorIdentificador, text: txtIdentificador, textError: "El identificador no tiene formato correcto",
                             textSucces: success, regexp: "^[a-zA-Z]+$")
            // telefono
            ,Validador.validar(lbl: lblErrorDescripcion, text: txtDescripcion, textError: "El formato de la descripcion no es correcto",
                                 textSucces: success, regexp: "^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]+$")
        ]
        var valido = true
        validaciones.forEach { (v) in
            if !v {
                valido = false
            }
        }
        // validar que al menos existan dos en el evento
        if contactosRelacionados.count < 2 {
            Validador.cambiarLbl(lbl: self.lblErrorCR, color: UIColor.brown, text: "Debe tener al menos 2 contactos agregados")
            valido = false
        }
        if !valido {
            // registrar
            
        }
    }
}

let agenda = Agenda.obtenerAgenda()
var contactosRelacionados = Array<Contacto>()

extension RegistrarEventoController : UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return agenda.obtenerContactos().count
    }
    
}

extension RegistrarEventoController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return agenda.obtenerContactos()[row].obtenerNombre()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print ("row: \(row)")
        //print ("value: \(self.myOptions[row])")
    }
    
}

extension RegistrarEventoController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactosRelacionados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let row = indexPath.row
        var c : Contacto = contactosRelacionados[row] as Contacto
        cell.textLabel?.text = c.obtenerNombre()
        //cell.detailTextLabel?.text = c.obtenerCorreo()
        return cell
    }
}
