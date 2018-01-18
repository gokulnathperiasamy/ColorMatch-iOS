//
//  ScoreUtil.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 18/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation

class ScoreUtil {
    
    private static let MAX_SCORE = "MaxScore"
    private static let MAX_CARDS = "MaxCards"
    
    static let userDefaults = UserDefaults.standard
    
    static func updateScoreAndCards(score: Int, cards: Int) {
        if (Int(getMaxScore())! < score) {
            userDefaults.set(score, forKey: MAX_SCORE)
        }
        if (Int(getMaxCards())! < cards) {
            userDefaults.set(cards, forKey: MAX_CARDS)
        }
    }
    
    static func getMaxScore() -> String {
        return userDefaults.string(forKey: MAX_SCORE) ?? "0"
    }
    
    static func getMaxCards() -> String {
        return userDefaults.string(forKey: MAX_CARDS) ?? "0"
    }
}
