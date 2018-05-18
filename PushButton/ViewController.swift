//
//  ViewController.swift
//  PushButton
//
//  Created by Janne Käki on 18/05/2018.
//  Copyright © 2018 Awesomeness Factory Oy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var pushButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    var secondsLeft: Int = 0 {
        didSet {
            timeLabel.text = "\(secondsLeft)"
            if secondsLeft == 0 {
                endGame()
            }
        }
    }
    
    private var timer: Timer?
    
    func startGame() {
        score = 0
        secondsLeft = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerDidFire), userInfo: nil, repeats: true)
        pushButton.isEnabled = true
        startButton.isHidden = true
    }
    
    func endGame() {
        timer?.invalidate()
        pushButton.isEnabled = false
        startButton.isHidden = false
    }
    
    @objc func timerDidFire() {
        secondsLeft -= 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushButton.setTitle("Push me", for: .normal)
        startButton.setTitle("Start game", for: .normal)
        
        pushButton.tintColor = UIColor.white
        pushButton.backgroundColor = UIColor(red: 0.3, green: 0.4, blue: 0.7, alpha: 1)
        pushButton.layer.cornerRadius = pushButton.frame.size.width / 2
        
        startGame()
    }
    
    @IBAction func pushButtonPressed() {
        score += 1
        NSLog("Push button pressed, score: %d", score)
    }
    
    @IBAction func startButtonPressed() {
        startGame()
    }
}
