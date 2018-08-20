//
//  ViewController.swift
//  ColorMatch
//
//  Created by Gokul Nath KP on 16/01/18.
//  Copyright © 2018 Gokul Nath KP. All rights reserved.
//

import UIKit

class MainVC: BaseVC {

    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var ctaPlayGame: UIButton!
    @IBOutlet weak var textMaxScore: UILabel!
    @IBOutlet weak var textMaxCards: UILabel!
    @IBOutlet weak var ctaAbout: UILabel!
    
    var countDownTimeLimit = AppConstants.COUNT_DOWN_TIMER_START_GAME
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        countDownAndShowStartGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView() {
        applyCornerRadius(view: viewA)
        applyCornerRadius(view: viewB)
        applyCornerRadius(view: ctaPlayGame)
        
        ctaAbout.isUserInteractionEnabled = true
        ctaAbout.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.aboutUs)))
        
        loadData()
    }
    
    func loadData() {
        textMaxScore.text = ScoreUtil.getMaxScore()
        textMaxCards.text = ScoreUtil.getMaxCards()
    }
    
    func countDownAndShowStartGame() {
        ctaPlayGame.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.startGame)), userInfo: nil, repeats: true)
    }
    
    @objc func startGame() {
        countDownTimeLimit -= 1
        if (countDownTimeLimit == 0) {
            timer.invalidate()
            AnimationUtil.animateFadeInView(view: self.ctaPlayGame)
            ctaPlayGame.isHidden = false
        }
    }
    
    @objc func aboutUs() {
        let alert = UIAlertController(title: "Color Match", message: "\nCopyright © Color Match 2018.\n\n Developer: Gokul Nath KP", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true) {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }

    @objc func alertControllerBackgroundTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

