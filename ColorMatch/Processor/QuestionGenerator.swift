//
//  QuestionGenerator.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 18/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation

class QuestionGenerator {
    
    static var arrayLength = AppConstants.COLOR_TEXT.count - 1
    
    static func getQuestion() -> QuestionEntity {
        let tempTextA = AppConstants.COLOR_TEXT[TextUtil.getRandomInt(min: 0, max: arrayLength)]
        var tempTextBColor = tempTextA
        if (TextUtil.getRandomInt(min: 111, max: 999) % 2 == 0) {
            tempTextBColor = AppConstants.COLOR_TEXT[TextUtil.getRandomInt(min: 0, max: arrayLength)]
        }
    
        let questionEntity = QuestionEntity()
        questionEntity.textA = tempTextA
        questionEntity.textAColor = AppConstants.COLOR_TEXT[TextUtil.getRandomInt(min: 0, max: arrayLength)]
        questionEntity.textB = AppConstants.COLOR_TEXT[TextUtil.getRandomInt(min: 0, max: arrayLength)]
        questionEntity.textBColor = tempTextBColor
        questionEntity.isCorrect = (tempTextA == tempTextBColor)

        return questionEntity
    }
    
}
