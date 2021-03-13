//
//  ShowViewController.swift
//  ARKitImageDetection
//
//  Created by FounderCoder on 07.12.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    var textSample = ""
    var name = ""
    var price = ""
    var descrip = ""
    var calories = ""

    
    @IBOutlet weak var textViewDetail: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let num = String(Int(Float(textSample)!) )
        
        textViewDetail.text =
            "NO. " + num + "\n\n" +
            "NAME: \n" + name + "\n\n" +
            "PRICE: \n" + price + "\n\n" +
            "DESCRIPTION: \n" + descrip + "\n\n" +
            "CALORIES: \n" + calories

    }
    
}
