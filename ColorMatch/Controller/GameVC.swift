//
//  GameVC.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 17/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import UIKit

class GameVC: BaseVC {

    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var ctaNo: UIButton!
    @IBOutlet weak var ctaYes: UIButton!
    @IBOutlet weak var viewTime: UIView!
    @IBOutlet weak var viewScore: UIView!
    @IBOutlet weak var textA: UILabel!
    @IBOutlet weak var textB: UILabel!
    
    var qE: QuestionEntity = QuestionEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
    }
    
    func initView() {
        applyCornerRadius(view: viewA)
        applyCornerRadius(view: viewB)
        applyCornerRadius(view: ctaNo)
        applyCornerRadius(view: ctaYes)
        applyCornerRadius(view: viewTime)
        applyCornerRadius(view: viewScore)
        
        getNewQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionNo(_ sender: Any) {
        if (qE.isCorrect == false) {
            checkAnswer(isCorrectAnswer: true)
        } else {
            checkAnswer(isCorrectAnswer: false)
        }
    }
    
    @IBAction func actionYes(_ sender: Any) {
        if (qE.isCorrect == true) {
            checkAnswer(isCorrectAnswer: true)
        } else {
            checkAnswer(isCorrectAnswer: false)
        }
    }
    
    func getNewQuestion() {
        qE = QuestionGenerator.getQuestion()
        textA.text = qE.textA
        textA.textColor = TextUtil.getUIColor(textColor: qE.textAColor)
        textB.text = qE.textB
        textB.textColor = TextUtil.getUIColor(textColor: qE.textBColor)
    }
    
    func checkAnswer(isCorrectAnswer: Bool) {
        if (isCorrectAnswer) {
            print("Correct!")
        } else {
            print("Wrong!")
        }
        getNewQuestion()
    }

}
