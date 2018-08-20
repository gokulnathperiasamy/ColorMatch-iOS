//
//  QuestionEntity.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 18/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import Foundation

class QuestionEntity {
    
    private var _textA: String = ""
    private var _textAColor: String = ""
    private var _textB: String = ""
    private var _textBColor: String = ""
    private var _isCorrect: Bool = false
    
    var textA: String {
        set { _textA = newValue }
        get { return _textA }
    }
    
    var textAColor: String {
        set { _textAColor = newValue }
        get { return _textAColor }
    }
    
    var textB: String {
        set { _textB = newValue }
        get { return _textB }
    }
    
    var textBColor: String {
        set { _textBColor = newValue }
        get { return _textBColor }
    }
    
    var isCorrect: Bool {
        set { _isCorrect = newValue }
        get { return _isCorrect }
    }
    
}
