//
//  BaseVC.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 17/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func applyCornerRadius(view: UIView) {
        view.layer.cornerRadius = 2.0
    }
    
}
