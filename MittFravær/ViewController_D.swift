//
//  ViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import UIKit


class ViewController_D: UIViewController, UITextFieldDelegate{
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var popupView1: UIView!
    
 
    @IBOutlet var pulsknapp4: [UIButton]!
    
    @IBOutlet weak var mineLagret4: GMStepper!
    
    @IBOutlet weak var ukenLagret4: GMStepper!
    
    @IBOutlet weak var lblProsent4: UILabel!
    
    
    let mineLagret4Visning = "mineLagret4Visning"
    let ukenLagret4Visning = "ukenLagret4Visning"
    let lblProsentLagring4 = "lblProsentLagring4"
    
    var uken4:Float = 1
    var mine4:Float = 0
    var prosent4:Float = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView1.layer.shadowOpacity = 100
        popupView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        popupView1.layer.shadowRadius = 15.0
        popupView1.layer.shadowColor = UIColor.darkGray.cgColor
        
        popupView1.layer.cornerRadius = 15
        popupView1.layer.masksToBounds = true
        for button in pulsknapp4 {
            button.layer.cornerRadius = 8
        }
        
        if let mineLagret4Visning = UserDefaults.standard.value(forKey: mineLagret4Visning){
            mineLagret4.value = mineLagret4Visning as! Double
        }
        
        if let ukenLagret4Visning = UserDefaults.standard.value(forKey: ukenLagret4Visning){
            ukenLagret4.value = ukenLagret4Visning as! Double
        }
        if let lblProsentLagring4 = UserDefaults.standard.value(forKey: lblProsentLagring4){
            lblProsent4.text = lblProsentLagring4 as? String
        }
        
        
        
    }
    
    
    @IBAction func pulseButtonTapped4(_ sender: UIButton) {
        sender.pulsate()
        
    }
    
    /* Utregning av fravær formel*/
    @IBAction func mineStepCustom4(_ sender: GMStepper) {
        mine4 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: mineLagret4Visning)
    }
    
    @IBAction func ukenStepCustom3(_ sender: GMStepper) {
        uken4 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: ukenLagret4Visning)
    }
    
    
    
    
    
    @IBAction func calcprosent4(_ sender: Any) {
        
        prosent4 = Float(mine4 * 100 / ( uken4 * 38 ))
        
        
        
        
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
        var str4 = ""
        
        switch (prosent4)
        {
        case 0...0:
            str4 = NSString(format: "Bruk kalkulatoren til å regne ut", prosent4 ) as String
            lblProsent4.backgroundColor = hexStringToUIColor(hex: "#7442BB")
            
        case 0...3:
            str4 = NSString(format: "Din prosent er %.2f \n🤓🤩", prosent4 ) as String
            
            
        case 3...4:
            str4 = NSString(format: "Din prosent er %.2f \n🤨🤔", prosent4 ) as String
            
            
        case 4...6:
            str4 = NSString(format: "Din prosent er %.2f \n😟🤭", prosent4 ) as String
            
            
        case 6...8:
            str4 = NSString(format: "Din prosent er %.2f \n😫😩", prosent4 ) as String
            
            
        case 8...9:
            str4 = NSString(format: "Din prosent er %.2f \n😢😿", prosent4 ) as String
            
            
        case 9...11:
            str4 = NSString(format: "Din prosent er %.2f \n😭🥺", prosent4 ) as String
            
            
        case 11...100:
            str4 = NSString(format: "Er det vits? %.2f \n🤬🤯", prosent4 ) as String
            
            
        default:
            
            str4 = NSString(format: "Din prosent er %.2f \n", prosent4 ) as String
            lblProsent4.backgroundColor = hexStringToUIColor(hex: "#7442BB")
        }
        
        lblProsent4.text = str4
        UserDefaults.standard.set(lblProsent4.text, forKey: lblProsentLagring4)
        
    }
    
    
}
