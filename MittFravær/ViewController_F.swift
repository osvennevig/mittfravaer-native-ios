//
//  ViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import UIKit


class ViewController_F: UIViewController, UITextFieldDelegate{
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var popupView1: UIView!
    
 
    @IBOutlet var pulsknapp6: [UIButton]!
    
    @IBOutlet weak var mineLagret6: GMStepper!
    
    @IBOutlet weak var ukenLagret6: GMStepper!
    
    @IBOutlet weak var lblProsent6: UILabel!
    
    
    let mineLagret6Visning = "mineLagret6Visning"
    let ukenLagret6Visning = "ukenLagret6Visning"
    let lblProsentLagring6 = "lblProsentLagring6"
    
    var uken6:Float = 1
    var mine6:Float = 0
    var prosent6:Float = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView1.layer.shadowOpacity = 100
        popupView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        popupView1.layer.shadowRadius = 15.0
        popupView1.layer.shadowColor = UIColor.darkGray.cgColor
        
        popupView1.layer.cornerRadius = 15
        popupView1.layer.masksToBounds = true
        for button in pulsknapp6 {
            button.layer.cornerRadius = 8
        }
        
        if let mineLagret6Visning = UserDefaults.standard.value(forKey: mineLagret6Visning){
            mineLagret6.value = mineLagret6Visning as! Double
        }
        
        if let ukenLagret6Visning = UserDefaults.standard.value(forKey: ukenLagret6Visning){
            ukenLagret6.value = ukenLagret6Visning as! Double
        }
        if let lblProsentLagring6 = UserDefaults.standard.value(forKey: lblProsentLagring6){
            lblProsent6.text = lblProsentLagring6 as? String
        }
        
        
        
    }
    
    
    @IBAction func pulseButtonTapped6(_ sender: UIButton) {
        sender.pulsate()
        
    }
    
    /* Utregning av fravær formel*/
    @IBAction func mineStepCustom6(_ sender: GMStepper) {
        mine6 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: mineLagret6Visning)
    }
    
    @IBAction func ukenStepCustom6(_ sender: GMStepper) {
        uken6 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: ukenLagret6Visning)
    }
    
    
    
    
    
    @IBAction func calcprosent6(_ sender: Any) {
        
        prosent6 = Float(mine6 * 100 / ( uken6 * 38 ))
        
        
        
        
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
        var str6 = ""
        
        switch (prosent6)
        {
        case 0...0:
            str6 = NSString(format: "Bruk kalkulatoren til å regne ut", prosent6 ) as String
            lblProsent6.backgroundColor = hexStringToUIColor(hex: "#7442BB")
            
        case 0...3:
            str6 = NSString(format: "Din prosent er %.2f \n🤓🤩", prosent6 ) as String
            
            
        case 3...4:
            str6 = NSString(format: "Din prosent er %.2f \n🤨🤔", prosent6 ) as String
            
            
        case 4...6:
            str6 = NSString(format: "Din prosent er %.2f \n😟🤭", prosent6 ) as String
            
            
        case 6...8:
            str6 = NSString(format: "Din prosent er %.2f \n😫😩", prosent6 ) as String
            
            
        case 8...9:
            str6 = NSString(format: "Din prosent er %.2f \n😢😿", prosent6 ) as String
            
            
        case 9...11:
            str6 = NSString(format: "Din prosent er %.2f \n😭🥺", prosent6 ) as String
            
            
        case 11...100:
            str6 = NSString(format: "Er det vits? %.2f \n🤬🤯", prosent6 ) as String
            
            
        default:
            
            str6 = NSString(format: "Din prosent er %.2f \n", prosent6 ) as String
            lblProsent6.backgroundColor = hexStringToUIColor(hex: "#7442BB")
        }
        
        lblProsent6.text = str6
        UserDefaults.standard.set(lblProsent6.text, forKey: lblProsentLagring6)
        
    }
    
    
}
