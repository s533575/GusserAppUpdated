//
//  FirstViewController.swift
//  GusserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var inputValue: UITextField!
    @IBOutlet weak var warningMessage: UILabel!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBAction func amIRight(_ sender: Any) {
        let value = inputValue.text!
        let guess1 = Guesser.shared
        if Int(value)! < 1 || Int(value)! > 10
        {
            warningMessage.text = "Please enter valid number "
        }
        else
        {
        let result = guess1.amIRight(guess: Int(value)!)
        if(result == "Correct")
        {
        message.text = "\(result)"
        displayMessage()
        button1.isEnabled = false
        }
            else
        {
            message.text = "\(result)"
            }
        }
    }
    
    @IBAction func createNewProblem(_ sender: Any) {
        inputValue.text = "0"
        message.text = ""
        warningMessage.text = ""
        button1.isEnabled = true
        let guess1 = Guesser.shared
        guess1.createNewProblem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let guess = Guesser.shared
        guess.createNewProblem()
    }

    func displayMessage(){
        let guess = Guesser.shared
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(guess.numAttemps) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

