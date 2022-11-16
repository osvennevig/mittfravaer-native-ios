//
//  ViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import UIKit


class ViewController_E: UIViewController, UITextFieldDelegate{
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var popupView1: UIView!
    
 
    @IBOutlet var pulsknapp5: [UIButton]!
    
    @IBOutlet weak var mineLagret5: GMStepper!
    
    @IBOutlet weak var ukenLagret5: GMStepper!
    
    @IBOutlet weak var lblprosent5: UILabel!
    
    
    let mineLagret5Visning = "mineLagret5Visning"
    let ukenLagret5Visning = "ukenLagret5Visning"
    let lblProsentLagring5 = "lblProsentLagring5"
    
    var uken5:Float = 1
    var mine5:Float = 0
    var prosent5:Float = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView1.layer.shadowOpacity = 100
        popupView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        popupView1.layer.shadowRadius = 15.0
        popupView1.layer.shadowColor = UIColor.darkGray.cgColor
        
        popupView1.layer.cornerRadius = 15
        popupView1.layer.masksToBounds = true
        for button in pulsknapp5 {
            button.layer.cornerRadius = 8
        }
        
        if let mineLagret5Visning = UserDefaults.standard.value(forKey: mineLagret5Visning){
            mineLagret5.value = mineLagret5Visning as! Double
        }
        
        if let ukenLagret5Visning = UserDefaults.standard.value(forKey: ukenLagret5Visning){
            ukenLagret5.value = ukenLagret5Visning as! Double
        }
        if let lblProsentLagring5 = UserDefaults.standard.value(forKey: lblProsentLagring5){
            lblprosent5.text = lblProsentLagring5 as? String
        }
        
        
        
    }
    
    
    @IBAction func pulseButtonTapped5(_ sender: UIButton) {
        sender.pulsate()
        
    }
    
    /* Utregning av fravær formel*/
    @IBAction func mineStepCustom5(_ sender: GMStepper) {
        mine5 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: mineLagret5Visning)
    }
    
    @IBAction func ukenStepCustom5(_ sender: GMStepper) {
        uken5 = Float(sender.value)
        /* UserDefaults */
        UserDefaults.standard.set(sender.value, forKey: ukenLagret5Visning)
    }
    
    
    
    
    
    @IBAction func calcprosent5(_ sender: Any) {
        
        prosent5 = Float(mine5 * 100 / ( uken5 * 38 ))
        
        
        
        
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
        var str5 = ""
        
        switch (prosent5)
        {
        case 0...0:
            str5 = NSString(format: "Bruk kalkulatoren til å regne ut", prosent5 ) as String
            lblprosent5.backgroundColor = hexStringToUIColor(hex: "#7442BB")
            
        case 0...3:
            str5 = NSString(format: "Din prosent er %.2f \n🤓🤩", prosent5 ) as String
            
            
        case 3...4:
            str5 = NSString(format: "Din prosent er %.2f \n🤨🤔", prosent5 ) as String
            
            
        case 4...6:
            str5 = NSString(format: "Din prosent er %.2f \n😟🤭", prosent5 ) as String
            
            
        case 6...8:
            str5 = NSString(format: "Din prosent er %.2f \n😫😩", prosent5 ) as String
            
            
        case 8...9:
            str5 = NSString(format: "Din prosent er %.2f \n😢😿", prosent5 ) as String
            
            
        case 9...11:
            str5 = NSString(format: "Din prosent er %.2f \n😭🥺", prosent5 ) as String
            
            
        case 11...100:
            str5 = NSString(format: "Er det vits? %.2f \n🤬🤯", prosent5 ) as String
            
            
        default:
            
            str5 = NSString(format: "Din prosent er %.2f \n", prosent5 ) as String
            lblprosent5.backgroundColor = hexStringToUIColor(hex: "#7442BB")
        }
        
        lblprosent5.text = str5
        UserDefaults.standard.set(lblprosent5.text, forKey: lblProsentLagring5)
        
    }
    
    
}
