//
//  ViewController.swift
//  Bubble Burst 2
//
//  Created by Jawad Shuaib on 2016-11-04.
//  Copyright © 2016 Jawad Shuaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var taps = 0
    var counter = 0
    var remainingTime: Int = 0
    let maxCount = 5
    
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var bubble: UIButton!
    
    @IBOutlet weak var tapLabel: UILabel!
    
    @IBAction func pop(_ sender: AnyObject) {
        
        showSomewhere()
        taps += 1

    }
    
    @IBAction func restartGame(_ sender: AnyObject) {
        
        taps = 0
        counter = 0
        tapLabel.isHidden = true
        restartButton.isHidden = true
        
        bubble.isHidden = false
        timerLabel.isHidden = false
        
        showSomewhere()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    func updateTime() {
        if counter >= maxCount {
            timer.invalidate()
            bubble.isHidden = true
            timerLabel.isHidden = true
            
            tapLabel.isHidden = false
            restartButton.isHidden = false
            
            tapLabel.text = "\(taps) Bubbles Bursted!"
        } else {
            remainingTime = maxCount - counter
            timerLabel.text = "\(remainingTime) Seconds Left"
            counter += 1
        }

    }
    
    func showSomewhere () {
        // get width and height of controller
        let viewWidth = bubble.superview!.bounds.width
        let viewHeight = bubble.superview!.bounds.height
        
        let buttonWidth = bubble.frame.width
        let buttonHeight = bubble.frame.height
        
        // Computer the width and height of the area to contain the button's center
        let xWidth = viewWidth - buttonWidth
        let xHeight = viewHeight - buttonHeight
        
        // Generate random x, y offset
        let xOffset = CGFloat (arc4random_uniform(UInt32(xWidth)))
        let yOffset = CGFloat (arc4random_uniform(UInt32(xHeight)))
    
        // offset the button's center by the random offsets
        bubble.center.x = xOffset + buttonWidth / 2
        bubble.center.y = yOffset + buttonHeight / 2
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSomewhere()
        bubble.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

