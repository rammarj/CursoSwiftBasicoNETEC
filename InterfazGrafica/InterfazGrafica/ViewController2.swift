//
//  ViewController2.swift
//  InterfazGrafica
//
//  Created by Macbook Pro A1990 on 12/5/18.
//  Copyright © 2018 Macbook Pro A1990. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let imageName = "gatito.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 160, y: 215, width: 50, height: 50)
        view.addSubview(imageView)
        
        // ejemplo 1 uitextview
        let str : NSString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque arcu urna, interdum nec auctor ac, ultrices quis tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc rhoncus semper facilisis."
        
        let textView = UITextView (frame: CGRect(x: 15, y: 280, width: 350, height: 50))
        
        textView.text = str as String
        textView.isEditable = false
        self.view.addSubview(textView)
        
        // Ejemplo 2 de UITextView
        let myBoldWord = str.range(of: "Lorem ipsum")
        
        let myMutableString =
            NSMutableAttributedString(
                string: str as String,
                attributes:
                [NSAttributedString.Key.font: UIFont(name: "Georgia",size: 18.0)!])
        
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont(name: "Helvetica Neue", size: 36.0)!,
            range: myBoldWord)
        
        let textView2 = UITextView(frame: CGRect(x: 15, y: 345, width: 350, height: 50))
        textView2.attributedText = myMutableString
        self.view.addSubview(textView2)

        let mySlider = UISlider(frame:CGRect(x:15, y:410, width:280, height:20))
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.isContinuous = false
        mySlider.tintColor = UIColor.red
        mySlider.value = 50
        mySlider.addTarget(self,
                           action:#selector(sliderValueDidChange(sender:)),
                           for: .valueChanged)
        self.view.addSubview(mySlider)

        let mySwitch=UISwitch(frame:CGRect(x:15, y:475, width:0, height:0));
        mySwitch.isOn = true
        mySwitch.setOn(false, animated: true);
        mySwitch.addTarget(self,
                           action:#selector(switchValueDidChange(sender:)),
                           for: .valueChanged);
        self.view.addSubview(mySwitch);
        
    }
    
    @objc func sliderValueDidChange(sender : UISlider) {
        
    }

    @objc func switchValueDidChange(sender : UISwitch) {
        
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
