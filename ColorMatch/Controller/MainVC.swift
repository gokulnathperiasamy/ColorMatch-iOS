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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initView()
    }
    
    func initView() {
        applyCornerRadius(view: viewA)
        applyCornerRadius(view: viewB)
        applyCornerRadius(view: ctaPlayGame)
        
        loadData()
    }
    
    func loadData() {
        textMaxScore.text = ScoreUtil.getMaxScore()
        textMaxCards.text = ScoreUtil.getMaxCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

