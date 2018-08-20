//
//  AnimationUtil.swift
//  ColorMatch
//
//  Created by Gokulnath Periasamy on 20/08/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation
import UIKit

class AnimationUtil {
    
    static func animateView(view: UIView) {
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 0.5
            view.alpha = 1.0
            view.alpha = 0.0
        })
    }
    
    static func animateCountDownView(view: UIView) {
        UIView.animate(withDuration: 1.0, animations: {
            view.alpha = 1.0
            view.alpha = 0.0
        })
    }
    
    static func animateFadeInView(view: UIView) {
        UIView.animate(withDuration: 1.0, animations: {
            view.alpha = 0.0
            view.alpha = 1.0
        })
    }
}
