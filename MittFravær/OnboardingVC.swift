//
//  OnboardingVC.swift
//  MittFravær
//
//  Created by Ole Svennevig on 04/01/2019.
//  Copyright © 2019 kvitér. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func continueTouched(_ sender: UIButton) {
    
    performSegue(withIdentifier: "toMainSegue", sender: self)
}
}
