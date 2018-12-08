//
//  ViewController.swift
//  AgendaUI
//
//  Created by Macbook Pro A1990 on 12/7/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbklContactos: UITableView!
    let agenda = Agenda.obtenerAgenda()
    
    @IBAction func btnAgregarContacto(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tbklContactos.dataSource = self
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.agenda.obtenerContactos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let row = indexPath.row
        var c : Contacto = agenda.obtenerContactos()[row] as Contacto
        cell.textLabel?.text = c.obtenerNombre()
        cell.detailTextLabel?.text = c.obtenerCorreo()
        return cell
    }
}
