//
//  EventosController.swift
//  AgendaUI
//
//  Created by Macbook Pro A1990 on 12/7/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class EventosController: UIViewController {

    @IBOutlet weak var tblEventos: UITableView!
    
    let agenda = Agenda.obtenerAgenda()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblEventos.dataSource = self
    }
    
    @IBAction func btnAgregarEvento(_ sender: Any) {
    }
}


extension EventosController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.agenda.obtenerEventos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let row = indexPath.row
        var c : Evento = agenda.obtenerEventos()[row] as Evento
        cell.textLabel?.text = c.obtenerIdentificador()
        cell.detailTextLabel?.text = c.obtenerDescripcion()
        return cell
    }
}
