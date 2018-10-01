//
//  ViewController.swift
//  PlayingCard
//
//  Created by Anti on 9/19/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
}
