//
//  TextUtil.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 18/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation

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
    
    static func getColorInt(textColor: String) -> String {
        switch(textColor) {
            case AppConstants.COLOR_BLACK:
                return ColorConstants.COLOR_CODE_BLACK;
            case AppConstants.COLOR_YELLOW:
                return ColorConstants.COLOR_CODE_YELLOW;
            case AppConstants.COLOR_RED:
                return ColorConstants.COLOR_CODE_RED;
            case AppConstants.COLOR_BLUE:
                return ColorConstants.COLOR_CODE_BLUE;
            case AppConstants.COLOR_GREEN:
                return ColorConstants.COLOR_CODE_GREEN;
            default:
                return ColorConstants.COLOR_CODE_BLACK;
        }
        
    }

}
