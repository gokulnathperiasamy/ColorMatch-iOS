//
//  TextUtil.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 18/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation
import UIKit

class TextUtil {
    
    static func getFormattedScore(doubleValue: Double) -> String {
        return String(format: "%06d", doubleValue);
    }
    
    static func getFormattedTime(doubleValue: Double) -> String {
        return String(format: "%02d", doubleValue);
    }
    
    static func getRandomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    static func getUIColor(textColor: String) -> UIColor {
        switch(textColor) {
            case AppConstants.COLOR_BLACK:
                return hexStringToUIColor(hex: ColorConstants.COLOR_CODE_BLACK)
            case AppConstants.COLOR_YELLOW:
                return hexStringToUIColor(hex: ColorConstants.COLOR_CODE_YELLOW)
            case AppConstants.COLOR_RED:
                return hexStringToUIColor(hex: ColorConstants.COLOR_CODE_RED)
            case AppConstants.COLOR_BLUE:
                return hexStringToUIColor(hex: ColorConstants.COLOR_CODE_BLUE)
            case AppConstants.COLOR_GREEN:
                return hexStringToUIColor(hex: ColorConstants.COLOR_CODE_GREEN)
            default:
                return hexStringToUIColor(hex: ColorConstants.COLOR_CODE_BLACK)
        }
    }
    
    static func hexStringToUIColor(hex:String) -> UIColor {
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

}
