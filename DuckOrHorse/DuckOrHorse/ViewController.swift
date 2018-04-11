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
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func tryLuckButtonTapped(_ sender: Any) {
  }
  
}

