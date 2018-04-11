//
//  ViewController.swift
//  DuckOrHorse
//
//  Created by Kayla Galway on 4/11/18.
//  Copyright © 2018 Kayla Galway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var calculatingLabel: UILabel!
  @IBOutlet weak var winnerLabel: UILabel!
  @IBOutlet weak var tryLuckButton: UIButton!
  
  var timer: Timer? = Timer()
  var sayings = ["Spinning up servers...",
                 "Calculating edges...",
                 "Running horse algorithm...",
                 "Manipulating duck data...",
                 "Testing Horse-Duck assumptions...",
                 "Checking on live duck migration patterns...",
                 "Breaking horses...",
                 "Counting feathers vs mane hairs...",
                 "Blockchain calculation of duck population...",
                 "Reading horse ebooks..."]
  var previouslyShown = Set<String>()
  var sayingCount = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtonBorder()
  }
  
  func choose() -> String {
    let x = arc4random_uniform(2)
    return x == 0 ? "HORSE" : "DUCK"
  }
  
  func startCalculations() {
    disableButton(disable: true)
    winnerLabel.text = ""
    showCalculationText()
    timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showCalculationText), userInfo: nil, repeats: true)
  }
  
  @objc func showCalculationText() {
    guard sayingCount < 4 else {
      endGame()
      return
    }
    while true {
      let sayingIndex = Int(arc4random_uniform(UInt32(sayings.count)))
      if !previouslyShown.contains(sayings[sayingIndex]) {
        calculatingLabel.text = sayings[sayingIndex]
        previouslyShown.insert(sayings[sayingIndex])
        break
      }
    }
    sayingCount += 1
  }
  
  func endGame() {
    sayingCount = 0
    timer?.invalidate()
    showChosenWinner()
    previouslyShown = Set<String>()
    disableButton(disable: false)
  }
  
  func disableButton(disable: Bool) {
    if disable {
      tryLuckButton.backgroundColor = UIColor.darkGray
      tryLuckButton.isUserInteractionEnabled = false
    } else {
      tryLuckButton.backgroundColor = UIColor(displayP3Red: 82/200, green: 28/200, blue: 161/200, alpha: 1)
      tryLuckButton.isUserInteractionEnabled = true
    }
  }
  
  func showChosenWinner() {
    calculatingLabel.text = ""
    winnerLabel.text = choose()
  }
  
  private func setupButtonBorder() {
    tryLuckButton.layer.borderColor = UIColor.white.cgColor
    tryLuckButton.layer.borderWidth = 1.0
  }

  @IBAction func tryLuckButtonTapped(_ sender: Any) {
    startCalculations()
  }
  
}

