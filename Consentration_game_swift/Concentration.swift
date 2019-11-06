//
//  Concentration.swift
//  Consentration_game_swift
//
//  Created by Erkan on 11/5/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import Foundation

class Concentration {

    var cards = [Card]()
    var indexOfAndOnlyFaceUpCard: Int?
    
    func flipDownAllCards(){
        for flipDownIndex in cards.indices{
            cards[flipDownIndex].isFaceUp = false
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfAndOnlyFaceUpCard{
                
            if matchIndex != index {
                //if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfAndOnlyFaceUpCard = nil
            }
            }else if cards[index].isFaceUp {
                //2 cards are face up !
                flipDownAllCards()
            }
            else {
                //no cards are face up
                flipDownAllCards()
                cards[index].isFaceUp = true
                indexOfAndOnlyFaceUpCard = index
            }
        } else{
            //2 cards matched
            flipDownAllCards()
        }
    }
    
    func restart(){
        
        flipDownAllCards()
        
    }

    init (numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //shuffle the cards
    }

}

