//
//  SecondViewController.swift
//  GusserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let guess1 = Guesser.shared
       return guess1.numGuesses()
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let guess1 = Guesser.shared
        let cell = tableView.dequeueReusableCell(withIdentifier: "guessArray")!
        cell.textLabel?.text = "Correct Answer: \(guess1.guess(index:indexPath.row).correctAnswer) #Attempst: \(guess1.guess(index: indexPath.row).numAttemptsRequired) "
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }



}

