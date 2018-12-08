//
//  ViewController.swift
//  UITableView
//
//  Created by Macbook Pro A1990 on 12/6/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tblView.dataSource = self
    }

}

// var a = UITableViewCell
// var autos = ["ferrari", "camion", "camioneta", "metro", "bus"]

var menus = MenuItems()

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.names.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = menus.names[indexPath.row]
        case 1:
            cell.textLabel?.text = String(menus.prices[indexPath.row])
        case 2:
            cell.textLabel?.text = String(menus.specials[indexPath.row])
        default:
            break
        }
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //let row = indexPath.row
        //cell.textLabel?.text = menus.names[row]
        //let price = String(format:"%2.2f", menus.prices[row])
        //cell.detailTextLabel?.text = price
        /*if menus.specials[row] {
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.white
        }*/
        return cell
    }
}
