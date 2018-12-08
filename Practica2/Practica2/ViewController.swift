//
//  ViewController.swift
//  Practica2
//
//  Created by Macbook Pro A1990 on 12/5/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // text fields
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    
    // labels
    @IBOutlet weak var lblSinConexion: UILabel!
    @IBOutlet weak var lblErrorUsuario: UILabel!
    @IBOutlet weak var lblErrorContra: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // settings lbls
        lblErrorUsuario.textColor = UIColor.brown
        lblErrorContra.textColor = UIColor.brown
        lblSinConexion.textColor = UIColor.brown
    }

    @IBAction func btnLogin(_ sender: Any) {
        if txtUsuario.text == "" {
            lblErrorUsuario.text = "Por favor ingrese el usuario."
            return
        }
        if txtContra.text == "" {
            lblErrorContra.text = "Por favor ingrese la contraseña."
            return
        }
        lblSinConexion.text = "El usuario no esta registrado."
    }
    
    @IBAction func btnLoginGoogle(_ sender: Any) {
        lblSinConexion.text = "Sin conexión."
    }
    
}

