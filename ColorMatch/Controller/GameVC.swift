//
//  GameVC.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 17/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import UIKit

class GameVC: BaseVC {

    @IBOutlet weak var questionContainer: UIStackView!
    @IBOutlet weak var optionsContainer: UIStackView!
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
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var textCountDownTimer: UILabel!
    
    var score: Int = 0
    var totalCorrectCards: Int = 0
    var continiousCorrectCards = 0
    var timeLimit = AppConstants.GAME_PLAY_TIME
    var countDownTimeLimit = AppConstants.COUNT_DOWN_TIMER
    var qE: QuestionEntity = QuestionEntity()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countDownAndStartGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView() {
        questionContainer.isHidden = false
        optionsContainer.isHidden = false
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
            continiousCorrectCards += 1
            totalCorrectCards += 1
            updateScore();
            showAnimation(isCorrectAnswer: true)
        } else {
            continiousCorrectCards = 0
            showAnimation(isCorrectAnswer: false)
        }
        getNewQuestion()
    }
    
    func showAnimation(isCorrectAnswer: Bool) {
        imageResult.isHidden = false
        scoreValue.isHidden = false
        if (isCorrectAnswer) {
            imageResult.image = UIImage(named: "ic_correct")
        } else {
            imageResult.image = UIImage(named: "ic_wrong")
        }
        AnimationUtil.animateView(view: self.imageResult)
        AnimationUtil.animateView(view: self.scoreValue)
    }
    
    func resetScoreAndStartNewGame() {
        textTime.text = "00:45 sec"
        textScore.text = TextUtil.getFormattedScore(value: 0)
        score = 0
        totalCorrectCards = 0
        continiousCorrectCards = 0
        timeLimit = AppConstants.GAME_PLAY_TIME
        imageResult.isHidden = true
        scoreValue.isHidden = true
        textCountDownTimer.isHidden = true
        startTimer()
    }
    
    func updateScore() {
        var newScore: Int
        if (continiousCorrectCards != 0 && continiousCorrectCards % AppConstants.BONUS_SPLIT == 0) {
            newScore = (continiousCorrectCards / AppConstants.BONUS_SPLIT) * TextUtil.getRandomInt(min: 501, max: 599)
        } else {
            newScore = TextUtil.getRandomInt(min: 79, max: 99)
        }
        score += newScore
        scoreValue.text = "+ \(newScore)"
        textScore.text = TextUtil.getFormattedScore(value: score)
    }
    
    func countDownAndStartGame() {
        textCountDownTimer.isHidden = false
        textCountDownTimer.layer.cornerRadius = textCountDownTimer.frame.width / 2
        textCountDownTimer.layer.masksToBounds = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.startGame)), userInfo: nil, repeats: true)
    }
    
    @objc func startGame() {
        countDownTimeLimit -= 1
        if (countDownTimeLimit == 0) {
            timer.invalidate()
            initView()
        }
        textCountDownTimer.text = "\(countDownTimeLimit)"
        AnimationUtil.animateCountDownView(view: self.textCountDownTimer)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLimit -= 1
        textTime.text = "00:\(TextUtil.getFormattedTime(value: timeLimit)) sec"
        if (timeLimit == 0) {
            timer.invalidate()
            gameOver()
        }
    }
    
    func gameOver() {
        saveScore()
        let storyBoard : UIStoryboard = UIStoryboard(name: "GameScreen", bundle:nil)
        
        let mainScreen = storyBoard.instantiateViewController(withIdentifier: "MainScreen") as! MainVC
        self.present(mainScreen, animated:true, completion:nil)
    }

    func saveScore() {
        ScoreUtil.updateScoreAndCards(score: score, cards: totalCorrectCards)
    }
    
}
