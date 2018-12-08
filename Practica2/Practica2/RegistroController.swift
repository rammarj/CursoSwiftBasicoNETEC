//
//  RegistroController.swift
//  Practica2
//
//  Created by Macbook Pro A1990 on 12/5/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class RegistroController: UIViewController {

    // lbl errores
    @IBOutlet weak var lblErrorNombre: UILabel!
    @IBOutlet weak var lblErrorTel: UILabel!
    @IBOutlet weak var lblErrorCorreo: UILabel!
    @IBOutlet weak var lblErrorContra: UILabel!
    @IBOutlet weak var lblErrorConfirmaContra: UILabel!
    @IBOutlet weak var lblErrorSexo: UILabel!
    @IBOutlet weak var lblErrorFechaNac: UILabel!
    @IBOutlet weak var lblErrorTerminos: UILabel!
    
    // txt infos
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTel: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    @IBOutlet weak var txtConfirmaContra: UITextField!
    @IBOutlet weak var txtSexo: UITextField!
    @IBOutlet weak var txtFechaNac: UITextField!
    
    // switch
    @IBOutlet weak var swAceptarTerminos: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblErrorNombre.text = ""
        lblErrorTel.text = ""
        lblErrorCorreo.text = ""
        lblErrorContra.text = ""
        lblErrorConfirmaContra.text = ""
        lblErrorSexo.text = ""
        lblErrorFechaNac.text = ""
        lblErrorTerminos.text = ""
        
        // contraseña
        //txtContra.isSecureTextEntry = true
        //txtConfirmaContra.isSecureTextEntry = true
    }
    
    func cambiarLbl(lbl : UILabel, color : UIColor, text : String) -> Void {
        lbl.text = text
        lbl.textColor = color
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func validar(lbl : UILabel, text : UITextField, textError : String, textSucces : String, regexp : String) -> Void {
        let eval = text.text!
        if eval.range(of: regexp, options: .regularExpression, range: nil, locale: nil) != nil {
            cambiarLbl(lbl: lbl, color: UIColor(red: 8.0/255.0, green: 153.0/255.0, blue: 83.0/255.0, alpha: 0.8), text: textSucces)
        }
        else {
            cambiarLbl(lbl: lbl, color: UIColor.brown, text: textError)
        }
    }
    
    @IBAction func btnRegistro(_ sender: Any) {
        let success = "Correcto"
        // nombre
        validar(lbl: lblErrorNombre, text: txtNombre, textError: "El nombre no tiene formato correcto",
                textSucces: success, regexp: "^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]+$")
        // telefono
        validar(lbl: lblErrorTel, text: txtTel, textError: "El formato del teléfono no es correcto",
                textSucces: success, regexp: "^\\d{10}$")
        // correo
        validar(lbl: lblErrorCorreo, text: txtCorreo, textError: "El formato del correo no es correcto",
                textSucces: success, regexp: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        // contraseña
        validar(lbl: lblErrorContra, text: txtContra, textError: "La contraseña debe contener al menos 4 letras",
                textSucces: success, regexp: "^[a-zA-Z0-9_ ]{4,}$")
        // contraseña confirm
        validar(lbl: lblErrorConfirmaContra, text: txtConfirmaContra, textError: "La contraseña debe contener al menos 4 letras",
                textSucces: success, regexp: "^[a-zA-Z0-9_ ]{4,}$")
        // sexo
        validar(lbl: lblErrorSexo, text: txtSexo, textError: "El sexo solo puede ser H o M",
                textSucces: success, regexp: "^[HM]$")
        // fecha nacimiento
        validar(lbl: lblErrorFechaNac, text: txtFechaNac, textError: "La fecha debe tener formato dd/mm/aaaa",
                textSucces: success, regexp: "^\\d{2}\\/\\d{2}\\/\\d{4}$")
        
        // validar contraseñas
        if txtContra.text != txtConfirmaContra.text {
            let error = "Las contraseñas no coinciden"
            cambiarLbl(lbl: lblErrorContra, color: UIColor.red, text: error )
            cambiarLbl(lbl: lblErrorConfirmaContra, color: UIColor.red, text: error )
            return
        }
        
        if !swAceptarTerminos.isOn {
            cambiarLbl(lbl: lblErrorTerminos, color: UIColor.brown, text: "Debe de aceptar los términos para usar la app")
            return
        }
        else {
            cambiarLbl(lbl: lblErrorTerminos, color: UIColor.black, text: "")
        }        
    }
}
