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
    @IBOutlet weak var textTime: UILabel!
    @IBOutlet weak var textScore: UILabel!
    
    var timer = Timer()
    var score: Int = 0
    var timeLimit = AppConstants.GAME_PLAY_TIME
    var qE: QuestionEntity = QuestionEntity()
    var continiousCorrectAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        applyCornerRadius(view: viewA)
        applyCornerRadius(view: viewB)
        applyCornerRadius(view: ctaNo)
        applyCornerRadius(view: ctaYes)
        applyCornerRadius(view: viewTime)
        applyCornerRadius(view: viewScore)
        
        resetScoreAndStartNewGame()
        getNewQuestion()
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
            continiousCorrectAnswer += 1
            updateScore();
        } else {
            continiousCorrectAnswer = 0
        }
        getNewQuestion()
    }
    
    func resetScoreAndStartNewGame() {
        textTime.text = "00:45 sec"
        textScore.text = TextUtil.getFormattedScore(value: 0)
        timer = Timer()
        score = 0
        timeLimit = AppConstants.GAME_PLAY_TIME
        continiousCorrectAnswer = 0
        startTimer()
    }
    
    func updateScore() {
        score += TextUtil.getRandomInt(min: 79, max: 99)
        if (continiousCorrectAnswer != 0 && continiousCorrectAnswer % AppConstants.BONUS_SPLIT == 0) {
            score += (continiousCorrectAnswer / AppConstants.BONUS_SPLIT) * TextUtil.getRandomInt(min: 501, max: 599)
        }
        textScore.text = TextUtil.getFormattedScore(value: score)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLimit -= 1
        textTime.text = "00:\(timeLimit) sec"
        if (timeLimit == 0) {
            gameOver()
        }
    }
    
    func gameOver() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "GameScreen", bundle:nil)
        
        let mainScreen = storyBoard.instantiateViewController(withIdentifier: "MainScreen") as! MainVC
        self.present(mainScreen, animated:true, completion:nil)
    }

}
