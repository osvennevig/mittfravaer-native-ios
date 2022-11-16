//
//  ViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import UIKit


class ViewController_B: UIViewController, UITextFieldDelegate{
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var popupView1: UIView!

    
    
    @IBOutlet var pulsknapp2: [UIButton]!
    
    @IBOutlet weak var mineLagret2: GMStepper!
    
    @IBOutlet weak var ukenLagret2: GMStepper!
    
    @IBOutlet weak var lblProsent2: UILabel!
    
    
    let mineLagret2Visning = "mineLagret2Visning"
    let ukenLagret2Visning = "ukenLagret2Visning"
    let lblProsentLagring2 = "lblProsentLagring2"
    
    var uken2:Float = 1
    var mine2:Float = 0
    var prosent2:Float = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView1.layer.shadowOpacity = 100
        popupView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        popupView1.layer.shadowRadius = 15.0
        popupView1.layer.shadowColor = UIColor.darkGray.cgColor
        
        popupView1.layer.cornerRadius = 15
        popupView1.layer.masksToBounds = true
        
        
        for button in pulsknapp2 {
            button.layer.cornerRadius = 8
        }
        
        if let mineLagret2Visning = UserDefaults.standard.value(forKey: mineLagret2Visning){
            mineLagret2.value = mineLagret2Visning as! Double
        }
        
        if let ukenLagret2Visning = UserDefaults.standard.value(forKey: ukenLagret2Visning){
            ukenLagret2.value = ukenLagret2Visning as! Double
        }
        if let lblProsentLagring2 = UserDefaults.standard.value(forKey: lblProsentLagring2){
            lblProsent2.text = lblProsentLagring2 as? String
        }
        
        
        
    }

    
    
    
    @IBAction func pulseButtonTapped2(_ sender: UIButton) {
        sender.pulsate()
        
    }
    
    /* Utregning av fravær formel*/
    @IBAction func mineStepCustom2(_ sender: GMStepper) {
        mine2 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: mineLagret2Visning)
    }
    
    @IBAction func ukenStepCustom2(_ sender: GMStepper) {
        uken2 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: ukenLagret2Visning)
    }
    

    
    
    
    @IBAction func calcprosent2(_ sender: Any) {
        
        prosent2 = Float(mine2 * 100 / ( uken2 * 38 ))
        
        
        
        
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
        var str2 = ""
        
        switch (prosent2)
        {
        case 0...0:
            str2 = NSString(format: "Bruk kalkulatoren til å regne ut", prosent2 ) as String
            lblProsent2.backgroundColor = hexStringToUIColor(hex: "#7442BB")
            
        case 0...3:
            str2 = NSString(format: "Din prosent er %.2f \n🤓🤩", prosent2 ) as String
            
        case 3...4:
            str2 = NSString(format: "Din prosent er %.2f \n🤨🤔", prosent2 ) as String
            
        case 4...6:
            str2 = NSString(format: "Din prosent er %.2f \n😟🤭", prosent2 ) as String
            
        case 6...8:
            str2 = NSString(format: "Din prosent er %.2f \n😫😩", prosent2 ) as String
            
        case 8...9:
            str2 = NSString(format: "Din prosent er %.2f \n😢😿", prosent2 ) as String
            
        case 9...11:
            str2 = NSString(format: "Din prosent er %.2f \n😭🥺", prosent2 ) as String
            
        case 11...100:
            str2 = NSString(format: "Er det vits? %.2f \n🤬🤯", prosent2 ) as String
            
        default:
            
            str2 = NSString(format: "Din prosent er %.2f \n", prosent2 ) as String
            lblProsent2.backgroundColor = hexStringToUIColor(hex: "#7442BB")
        }
        
        lblProsent2.text = str2
        UserDefaults.standard.set(lblProsent2.text, forKey: lblProsentLagring2)
        
        
    }
    
    
}
