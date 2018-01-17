//
//  BaseVC.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 17/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func applyCornerRadius(view: UIView) {
        view.layer.cornerRadius = 2.0
    }
    
}
