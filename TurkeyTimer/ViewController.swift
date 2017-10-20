//
//  ViewController.swift
//  TurkeyTimer
//
//  Created by Bryn Beaudry on 2017-10-20.
//  Copyright © 2017 Bryn Beaudry. All rights reserved.
//

import UIKit
class InputViewController: UIViewController {
    
    var totalTime : TimeInterval = 0.00
    let seconds : TimeInterval = 0.00
    let secondsInMin : TimeInterval = 60.00
    let minutesInHour : TimeInterval = 60.00 * 60.00
    var timer = Timer()
    var timeRemaining : TimeInterval = 0.0
    
    @IBOutlet var weight: UITextField!
    @IBOutlet var isStuffed: UISwitch!
    
    @IBAction func setTimerBtn(_ sender: Any) {
        calculateTime()
    }
    @IBOutlet var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "00:00:00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timerRunning() {
        timeRemaining -= 1
        let hoursLeft = Int(timeRemaining) / (60 * 60)
        let minutesLeft = Int(timeRemaining) / 60 % 60
        let secondsLeft = Int(timeRemaining) % 60
        timeLabel.text = "\(hoursLeft):\(minutesLeft):\(secondsLeft)"
    }
    
    func calculateTime() {
        let nweight = Double(weight.text!)
        if(isStuffed.isOn){
            totalTime = 23 * secondsInMin * nweight!
        }else{
            totalTime = 18 * secondsInMin * nweight!
        }
        timeRemaining = totalTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
    }
    
    
}
