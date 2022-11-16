//
//  webViewQuiz.swift
//  MittFravær
//
//  Created by Ole Svennevig on 19/01/2019.
//  Copyright © 2019 kvitér. All rights reserved.
//

import UIKit
import WebKit

class webViewQuiz: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MinURL = URL(string: "https://xn--mittfravr-n3a.no/quiz/")  
        let request = URLRequest(url: MinURL!)
        
        webView.load(request)
        
    }
    
    
    
}
