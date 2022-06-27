//
//  ViewController.swift
//  EggTimer
//
//  Created by Barış Yeşilkaya on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggsMinute = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    
    var fullTime : Float = 0
    
    var timer = Timer()
    
    var secondRemaining : Int = 0
    
    
    override func viewDidLoad() {
        progressBar.progress = 0
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        timer.invalidate()
        
        let egg = sender.titleLabel?.text!
        
        fullTime = Float(eggsMinute[egg!]!)
        
        progressBar.progress = 0.0
        
        mainTitle.text = """
                        Mmm \(egg!)
                        \(fullTime) seconds.
                        """
        
        secondRemaining = Int(fullTime)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        if secondRemaining > 0{
            mainTitle.text = "\(secondRemaining - 1) seconds."
            secondRemaining -= 1
            progressBar.progress += 1/fullTime
        } else {
            timer.invalidate()
            mainTitle.text = "DONE!!!"
        }
    }

    
    
    
}

