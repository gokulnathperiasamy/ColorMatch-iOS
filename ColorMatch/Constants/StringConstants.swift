//
//  StringConstants.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 16/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation

class StringConstants {
    
    /************************** Public Members ****************************/
    
    public static let APP_NAME = "Color Match"
    public static let APP_VERSION = StringConstants.getAppVersion()
    public static let COPYRIGHT_MESSAGE = "Copyright © Color Match 2018. All rights reserved."
    
    /*********************** Private Getters/Setters **********************/
    
    private static func getAppVersion() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "1.0.0"
    }

}
