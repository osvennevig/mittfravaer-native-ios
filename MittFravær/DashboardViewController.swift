//
//  DashboardViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 28/01/2019.
//  Copyright © 2019 kvitér. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController, UITextFieldDelegate, UIViewControllerTransitioningDelegate {
    
    
    let fagBoks1Lagret = "fagBoks1Lagret"
    @IBOutlet weak var fagBoks1: UITextField!
    @IBAction func fagBoks1Lagret(_ sender: UITextField) {
    UserDefaults.standard.set(fagBoks1.text, forKey: fagBoks1Lagret)
}
    
    let fagBoks2Lagret = "fagBoks2Lagret"
    @IBOutlet weak var fagBoks2: UITextField!
    @IBAction func fagBoks2Lagret(_ sender: UITextField) {
        UserDefaults.standard.set(fagBoks2.text, forKey: fagBoks2Lagret)
    }
    
    let fagBoks3Lagret = "fagBoks3Lagret"
    @IBOutlet weak var fagBoks3: UITextField!
    @IBAction func fagBoks3Lagret(_ sender: UITextField) {
        UserDefaults.standard.set(fagBoks3.text, forKey: fagBoks3Lagret)
    }
    let fagBoks4Lagret = "fagBoks4Lagret"
    @IBOutlet weak var fagBoks4: UITextField!
    @IBAction func fagBoks4Lagret(_ sender: UITextField) {
        UserDefaults.standard.set(fagBoks4.text, forKey: fagBoks4Lagret)
    }
    let fagBoks5Lagret = "fagBoks5Lagret"
    @IBOutlet weak var fagBoks5: UITextField!
    @IBAction func fagBoks5Lagret(_ sender: UITextField) {
        UserDefaults.standard.set(fagBoks5.text, forKey: fagBoks5Lagret)
    }
    let fagBoks6Lagret = "fagBoks6Lagret"
    @IBOutlet weak var fagBoks6: UITextField!
    @IBAction func fagBoks6Lagret(_ sender: UITextField) {
        UserDefaults.standard.set(fagBoks6.text, forKey: fagBoks6Lagret)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         addNavBarImage()
        
        if let fagBoks1Lagret = UserDefaults.standard.value(forKey: fagBoks1Lagret){
            fagBoks1.text = fagBoks1Lagret as? String
        }
        if let fagBoks2Lagret = UserDefaults.standard.value(forKey: fagBoks2Lagret){
            fagBoks2.text = fagBoks2Lagret as? String
        }
        if let fagBoks3Lagret = UserDefaults.standard.value(forKey: fagBoks3Lagret){
            fagBoks3.text = fagBoks3Lagret as? String
        }
        if let fagBoks4Lagret = UserDefaults.standard.value(forKey: fagBoks4Lagret){
            fagBoks4.text = fagBoks4Lagret as? String
        }
        if let fagBoks5Lagret = UserDefaults.standard.value(forKey: fagBoks5Lagret){
            fagBoks5.text = fagBoks5Lagret as? String
        }
        if let fagBoks6Lagret = UserDefaults.standard.value(forKey: fagBoks6Lagret){
            fagBoks6.text = fagBoks6Lagret as? String
        }
        
    }
    
    
    
    
// Navbar logo
    func addNavBarImage() {
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "Logo med IkonX")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }

    
/* Hide keyboard */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    /* reklameBanner lenke */
    @IBAction func reklameBanner(_sender: Any) {
        UIApplication.shared.open(URL(string: "http://www.skral.no/program/")! as URL, options: [:], completionHandler: nil)
    }
    

}
