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
    var progressNumber : Int = 0
    
    
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
    }
    
    func checkAnswer() {
        if (allQuestions.list[questionNumber].answer == pickedAnswer) {
            score += 1
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        questionNumber += 1
        progressNumber += 1
        
        if (questionNumber > allQuestions.list.count - 1) {
            startOver()
        }
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(progressNumber + 1)/ \(allQuestions.list.count)"
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        progressNumber = 0
    }
}
