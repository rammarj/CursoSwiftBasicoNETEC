//
//  ViewController.swift
//  PickerView
//
//  Created by Macbook Pro A1990 on 12/6/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        uiPickerView.dataSource = self
        uiPickerView.delegate = self
    }

    // MARK: - PickerView
    
    let myOptions : [String] = ["one","two","three","four"]
    
    func creaPickerView(){
        /*
        let myPickerView = UIPickerView()
        myPickerView.frame = CGRect(x:0, y:100, width:self.view.bounds.width, height:280)
        
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        self.view.addSubview(myPickerView)
 */
        self.uiPickerView.dataSource = self
        
    }
}

/////////////////////////////////////////////////////
// MARK: - Extensiones para PickerView
/////////////////////////////////////////////////////
extension ViewController : UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    
}

var arr = ["campana", "ramirez", "martinez", "joaquin", "villalba", "griselda"]
var arr2 = ["joaquin", "ramirez", "martinez", "trata", "villalba", "griselda"]

extension ViewController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arr[row]
        }
        return arr2[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print ("row: \(row) de la columna \(component)")
    }
    
}
