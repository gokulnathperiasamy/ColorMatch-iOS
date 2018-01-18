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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionNo(_ sender: Any) {
        
    }
    
    @IBAction func actionYes(_ sender: Any) {
        let qE = QuestionGenerator.getQuestion()
        print(qE.textA)
        print(qE.textAColor)
        print(qE.textB)
        print(qE.textBColor)
        print(qE.isCorrect)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
