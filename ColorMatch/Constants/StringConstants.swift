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
    
    public static let APP_NAME = StringConstants.getAppName()
    public static let APP_VERSION = StringConstants.getAppVersion()
    
    public static let APP_DESCRIPTION = "Determine if the meaning matches the text color."
    public static let GAME_DESCRIPTION = "Does the meaning match the text color?"
    public static let BEST_SCORE = "Best Score"
    public static let MAXIMUM_CARDS = "Maximum Cards"
    
    public static let CTA_PLAY_GAME = "Play Game"
    
    public static let COPYRIGHT_MESSAGE = "Copyright © Color Match 2017. All rights reserved."
    
    /*********************** Private Getters/Setters **********************/
    
    private static func getAppVersion() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "1.0.0"
    }
    
    private static func getAppName() -> String {
        return "Color Match"
    }
}
