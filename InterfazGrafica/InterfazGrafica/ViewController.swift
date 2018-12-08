//
//  ViewController.swift
//  InterfazGrafica
//
//  Created by Macbook Pro A1990 on 12/5/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblNombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // UILabel
        let label = UILabel(frame: CGRect(x: 85, y: 50, width: 200, height: 50))
        label.textAlignment = .center
        label.text = "Hola a todos"
        label.textColor = .red
        label.textAlignment = .center
        label.layer.borderWidth = 1
        self.view.addSubview(label)

        self.lblNombre.textColor = .red
        self.lblNombre.text = "Curso de Swift"
        
        
        let button = UIButton()
        button.frame = CGRect(x: 85, y: 160, width: 200, height: 50)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Send ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 32, green: 0.76, blue: 0.37, alpha: 0.6)
        self.view.addSubview(button)
        
        let textField = UITextField(frame: CGRect(x: 85, y: 105, width: 200, height: 50))
        textField.textAlignment = NSTextAlignment.center
        textField.textColor = UIColor.red
        //textField.borderStyle = UITextBorderStyle.line
        textField.placeholder = "Your name here ..."
        self.view.addSubview(textField)
        

        btnCalcular.setTitle("Calcular", for: .normal)
        
        
    }

    @IBOutlet weak var imgGato: UIImageView!
    @IBOutlet weak var btnCalcular: UIButton!
    
    @IBAction func btnCalcular(_ sender: Any) {
        lblNombre.backgroundColor = .red
    }
    
    @objc func buttonAction(){
        self.lblNombre.text = "Hola, desde evento"
    }
    
    @objc func sliderValieDidChange(sender : UISlider){
        
    }

    @objc func switchValueDidChange(sender : UISwitch){
        
    }
}

