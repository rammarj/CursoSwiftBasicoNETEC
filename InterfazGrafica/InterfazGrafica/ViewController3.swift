//
//  ViewController3.swift
//  InterfazGrafica
//
//  Created by Macbook Pro A1990 on 12/6/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    private let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let myActivityIndicator = UIActivityIndicatorView(
          //  style: UIActivityIndicatorView.Style.gray)
        // Do any additional setup after loading the view
        myActivityIndicator.center = view.center
        //myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.hidesWhenStopped = true
        myActivityIndicator.color = UIColor.red
        self.view.addSubview(myActivityIndicator)
        
        self.creaProgressView()
        self.creaStepper()
        self.creaDatePicker()
    }
    
    @IBAction func btnParar(_ sender: Any) {
        myActivityIndicator.stopAnimating()
    }
    
    @IBAction func btnIniciar(_ sender: Any) {
        myActivityIndicator.startAnimating()
    }
    
    // MARK: - ProgressView
    
    var seconds : Float = 0
    var timer : Timer!
    var myProgressView : UIProgressView!
    
    func creaProgressView(){
        
        myProgressView = UIProgressView(progressViewStyle: .default)
        myProgressView.frame.origin = CGPoint(x:125,y:475)
        myProgressView.frame.size = CGSize(width:150,height:150)
        //myProgressView.center.x = self.view.center.x
        myProgressView.progress = 0
        myProgressView.progressTintColor = UIColor.red
        myProgressView.trackTintColor = UIColor.lightGray
        self.view.addSubview(myProgressView)
        exTimer()
        
    }
    
    func exTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self, selector: #selector(self.updateProgressView),
                                     userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressView() {
        seconds += 1
        if seconds <= 10 {
            myProgressView.setProgress(seconds / 10, animated: true)
            print("\(seconds * 10)%")
        } else {
            timer.invalidate()
        }
    }
    
    
    // ui stepper
    // MARK: - Stepper
    
    func creaStepper(){
        
        let myStepper = UIStepper (frame:CGRect(x:15, y:540, width:0, height:0))
        myStepper.wraps = false
        myStepper.autorepeat = false
        myStepper.maximumValue = 10
        myStepper.addTarget(self,
                            action:#selector(stepperValueChanged(sender:)),
                            for: .valueChanged)
        self.view.addSubview(myStepper)
    }
    
    @objc func stepperValueChanged(sender: UIStepper){
        print("Value stepper: \(Int(sender.value).description)")
    }
    
    // MARK: - DatePiker
    func creaDatePicker(){
        
        let myDatePicker = UIDatePicker(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        myDatePicker.center.x = self.view.center.x
        myDatePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        myDatePicker.backgroundColor = UIColor.white
        myDatePicker.addTarget(self,
                               action: #selector(datePickerValueChanged), for: .valueChanged)
        self.view.addSubview(myDatePicker)
        
    }
    
    @objc func datePickerValueChanged(sender :UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
    }
}
