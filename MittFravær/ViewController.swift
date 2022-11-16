//
//  ViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate{
        
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var popupView1: UIView!
    
    
    
    @IBOutlet var pulsknapp: [UIButton]!
    
    @IBOutlet weak var mineLagret1: GMStepper!
    
    @IBOutlet weak var ukenLagret1: GMStepper!
    
    @IBOutlet weak var lblProsent: UILabel!
    
    let mineLagret1Visning = "mineLagret1Visning"
    let ukenLagret1Visning = "ukenLagret1Visning"
    let lblProsentLagring = "lblProsentLagring"
    
    var uken:Float = 1
    var mine:Float = 0
    var prosent:Float = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView1.layer.shadowOpacity = 100
        popupView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        popupView1.layer.shadowRadius = 15.0
        popupView1.layer.shadowColor = UIColor.darkGray.cgColor
        
        popupView1.layer.cornerRadius = 15
        popupView1.layer.masksToBounds = true
        
        for button in pulsknapp {
            button.layer.cornerRadius = 8
        }
        
        if let mineLagret1Visning = UserDefaults.standard.value(forKey: mineLagret1Visning){
            mineLagret1.value = mineLagret1Visning as! Double
        }
        
        if let ukenLagret1Visning = UserDefaults.standard.value(forKey: ukenLagret1Visning){
            ukenLagret1.value = ukenLagret1Visning as! Double
        }
        if let lblProsentLagring = UserDefaults.standard.value(forKey: lblProsentLagring){
            lblProsent.text = lblProsentLagring as? String
        }
        
        
        
        

    }
    
/* Hide keyboard */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    

    @IBAction func pulseButtonTapped(_ sender: UIButton) {
        sender.pulsate()
        
    }

/* Utregning av fravær formel*/
    @IBAction func mineStepCustom(_ sender: GMStepper) {
        mine = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: mineLagret1Visning)
    }
    
    @IBAction func ukenStepCustom(_ sender: GMStepper) {
        uken = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: ukenLagret1Visning)
    }
    
    
    
    
    
    
    @IBAction func calcprosent(_ sender: Any) {
        
        prosent = Float(mine * 100 / ( uken * 38 ))
        
        
        
        
/* Farger: RGB til hex. til fravær vising */
        
        func hexStringToUIColor (hex:String) -> UIColor {
            var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            
            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }
            
            if ((cString.count) != 6) {
                return UIColor.gray
            }
            
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
        
       
        
        
        
/* Utregning av fravær vising */
        var str = ""
        
        switch (prosent)
        {
        case 0...0:
            str = NSString(format: "Bruk kalkulatoren til å regne ut", prosent ) as String
            lblProsent.backgroundColor = hexStringToUIColor(hex: "#7442BB")
            
        case 0...3:
            str = NSString(format: "Din prosent er %.2f \n🤓🤩", prosent ) as String
            
            
        case 3...4:
            str = NSString(format: "Din prosent er %.2f \n🤨🤔", prosent ) as String
            
            
        case 4...6:
            str = NSString(format: "Din prosent er %.2f \n😟🤭", prosent ) as String
            
        case 6...8:
            str = NSString(format: "Din prosent er %.2f \n😫😩", prosent ) as String
            
        case 8...9:
            str = NSString(format: "Din prosent er %.2f \n😢😿", prosent ) as String
            
        case 9...11:
            str = NSString(format: "Din prosent er %.2f \n😭🥺", prosent ) as String
            
        case 11...100:
            str = NSString(format: "Er det vits? %.2f \n🤬🤯", prosent ) as String
            
        default:
            
            str = NSString(format: "Din prosent er %.2f \n", prosent ) as String
            lblProsent.backgroundColor = hexStringToUIColor(hex: "#7442BB")
        }
    
        lblProsent.text = str
        UserDefaults.standard.set(lblProsent.text, forKey: lblProsentLagring)
        
        
    }
    

}
