//
//  Card.swift
//  Consentration_game_swift
//
//  Created by Erkan on 11/5/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 1
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
