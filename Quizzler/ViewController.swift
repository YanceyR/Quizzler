//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = (sender.tag == 1 ? true : false)
        checkAnswer()
        nextQuestion()
    }
    
    func checkAnswer() {
        if (allQuestions.list[questionNumber].answer == pickedAnswer) {
            score += 1
            ProgressHUD.showSuccess("Correct!")
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func nextQuestion() {
        questionNumber += 1
        
        if (questionNumber > allQuestions.list.count - 1) {
            displayAlert()
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/ \(allQuestions.list.count)"
        progressBar.frame.size.width =
            (view.frame.size.width / CGFloat(allQuestions.list.count)) *
            CGFloat(questionNumber + 1)
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
    }
    
    func displayAlert() {
        let alert = UIAlertController(title: "Great", message: "You've finished"
            ,preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) {
            (UIAlertAction) in
            self.startOver()
        }
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
}
