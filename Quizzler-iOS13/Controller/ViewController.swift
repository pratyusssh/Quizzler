//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
 
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle //maybe t or f
        let actualAnswer = quiz[quesNum].answer
        
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            count = count+1
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        if quesNum+1 < quiz.count {
            quesNum+=1
        }else{
            quesNum=0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
  
        
    }
    
    @objc func updateUI(){
        questionLabel.text =  quiz[quesNum].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(quesNum+1)/Float(quiz.count)

    }
    
    @IBAction func showResult(){
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "result") as! resultpageViewController
        present(vc,animated: true)
    }
}


