//
//  RegistrarContactoController.swift
//  AgendaUI
//
//  Created by Macbook Pro A1990 on 12/7/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class RegistrarContactoController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var tctFechaNac: UITextField!
    @IBOutlet weak var txtDomicilio: UITextField!
    @IBOutlet weak var txtEmpresa: UITextField!
    @IBOutlet weak var txtParentezco: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtCorre: UITextField!
    
    // lbls
    @IBOutlet weak var lblErrorNombre: UILabel!
    @IBOutlet weak var lblErrorFechaNac: UILabel!
    @IBOutlet weak var lblErroirDomicilio: UILabel!
    @IBOutlet weak var lblErrorCorre: UILabel!
    @IBOutlet weak var lblErrorEmprea: UILabel!
    @IBOutlet weak var lblErrorParentezco: UILabel!
    @IBOutlet weak var lblErrorTel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lblErroirDomicilio.text = ""
        self.lblErrorEmprea.text = ""
        self.lblErrorParentezco.text = ""
        self.lblErrorTel.text = ""
        self.lblErrorCorre.text = ""
        self.lblErrorFechaNac.text = ""
        self.lblErrorNombre.text = ""
    }
    
    @IBAction func btnRegistrarContacto(_ sender: Any) {
        let success = "Correcto"
        // nombre
        var validaciones = [Validador.validar(lbl: lblErrorNombre, text: txtNombre, textError: "El nombre no tiene formato correcto",
                textSucces: success, regexp: "^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]+$")
        // telefono
        ,Validador.validar(lbl: lblErrorTel, text: txtTelefono, textError: "El formato del teléfono no es correcto",
                textSucces: success, regexp: "^\\d{10}$")
        // correo
        ,Validador.validar(lbl: lblErrorCorre, text: txtCorre, textError: "El formato del correo no es correcto",
                textSucces: success, regexp: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        // fecha nacimiento
        ,Validador.validar(lbl: lblErrorFechaNac, text: tctFechaNac, textError: "La fecha debe tener formato dd/mm/aaaa",
                textSucces: success, regexp: "^\\d{2}\\/\\d{2}\\/\\d{4}$")
        // parentesco
        ,Validador.validar(lbl: lblErrorParentezco, text: txtParentezco, textError: "El parentesco no tiene formato correcto",
                          textSucces: success, regexp: "^[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$")
        // empresa
        ,Validador.validar(lbl: lblErrorEmprea, text: txtEmpresa, textError: "La empresa no tiene formato correcto",
                          textSucces: success, regexp: "^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]+$")
        // domicilio
        ,Validador.validar(lbl: lblErroirDomicilio, text: txtDomicilio, textError: "El domicilio no tiene formato correcto",
                          textSucces: success, regexp: "^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ_ ]+$")
        ]
        
        var valido = true
        validaciones.forEach { (v) in
            if !v {
                valido = false
            }
        }
        if valido {
            // registrar
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
