//
//  ViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import UIKit


class ViewController_C: UIViewController, UITextFieldDelegate{
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var popupView1: UIView!
    
 
    @IBOutlet var pulsknapp3: [UIButton]!
    
    @IBOutlet weak var mineLagret3: GMStepper!
    
    @IBOutlet weak var ukenLagret3: GMStepper!
    
    @IBOutlet weak var lblProsent3: UILabel!
    
    
    let mineLagret3Visning = "mineLagret3Visning"
    let ukenLagret3Visning = "ukenLagret3Visning"
    let lblProsentLagring3 = "lblProsentLagring3"
    
    var uken3:Float = 1
    var mine3:Float = 0
    var prosent3:Float = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView1.layer.shadowOpacity = 100
        popupView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        popupView1.layer.shadowRadius = 15.0
        popupView1.layer.shadowColor = UIColor.darkGray.cgColor
        
        popupView1.layer.cornerRadius = 15
        popupView1.layer.masksToBounds = true
        for button in pulsknapp3 {
            button.layer.cornerRadius = 8
        }
        
        if let mineLagret3Visning = UserDefaults.standard.value(forKey: mineLagret3Visning){
            mineLagret3.value = mineLagret3Visning as! Double
        }
        
        if let ukenLagret3Visning = UserDefaults.standard.value(forKey: ukenLagret3Visning){
            ukenLagret3.value = ukenLagret3Visning as! Double
        }
        if let lblProsentLagring3 = UserDefaults.standard.value(forKey: lblProsentLagring3){
            lblProsent3.text = lblProsentLagring3 as? String
        }
        
        
        
    }
    
    
    @IBAction func pulseButtonTapped3(_ sender: UIButton) {
        sender.pulsate()
        
    }
    
    /* Utregning av fravær formel*/
    @IBAction func mineStepCustom3(_ sender: GMStepper) {
        mine3 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: mineLagret3Visning)
    }
    
    @IBAction func ukenStepCustom3(_ sender: GMStepper) {
        uken3 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: ukenLagret3Visning)
    }
    
    
    
    
    
    @IBAction func calcprosent3(_ sender: Any) {
        
        prosent3 = Float(mine3 * 100 / ( uken3 * 38 ))
        
        
        
        
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
        var str3 = ""
        
        switch (prosent3)
        {
        case 0...0:
            str3 = NSString(format: "Bruk kalkulatoren til å regne ut", prosent3 ) as String
            lblProsent3.backgroundColor = hexStringToUIColor(hex: "#7442BB")
            
        case 0...3:
            str3 = NSString(format: "Din prosent er %.2f \n🤓🤩", prosent3 ) as String
            
            
        case 3...4:
            str3 = NSString(format: "Din prosent er %.2f \n🤨🤔", prosent3 ) as String
            
            
        case 4...6:
            str3 = NSString(format: "Din prosent er %.2f \n😟🤭", prosent3 ) as String
            
            
        case 6...8:
            str3 = NSString(format: "Din prosent er %.2f \n😫😩", prosent3 ) as String
            
            
        case 8...9:
            str3 = NSString(format: "Din prosent er %.2f \n😢😿", prosent3 ) as String
            
            
        case 9...11:
            str3 = NSString(format: "Din prosent er %.2f \n😭🥺", prosent3 ) as String
            
            
        case 11...100:
            str3 = NSString(format: "Er det vits? %.2f \n🤬🤯", prosent3 ) as String
            
            
        default:
            
            str3 = NSString(format: "Din prosent er %.2f \n", prosent3 ) as String
            lblProsent3.backgroundColor = hexStringToUIColor(hex: "#7442BB")
        }
        
        lblProsent3.text = str3
        UserDefaults.standard.set(lblProsent3.text, forKey: lblProsentLagring3)
        
    }
    
    
}
