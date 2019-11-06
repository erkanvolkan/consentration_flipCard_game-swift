//
//  ViewController.swift
//  Consentration_game_swift
//
//  Created by Erkan on 11/5/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButons.count + 1) / 2)
    
    
    var flipCount: Int = 0 {
        didSet {
             flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var cardButons: [UIButton]!
    
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModule()
        }else{
            print("choosen card is not avaiable")
        }
        
    }
    func updateViewFromModule() {
        for index in 0 ..< cardButons.count {
         let button = cardButons[index]
         let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card),for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("",for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.01653279049) :  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
   
    
    var emojiChoices = ["👻","🐶","🐥","🍐","🍉","🥝","🍊","⚾️"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}

