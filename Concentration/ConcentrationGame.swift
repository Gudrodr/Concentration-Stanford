//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Aleksandr Romanenko on 25.11.2020.
//

import Foundation

class ConcentrationGame {
    var cards = [Card]()
    var facedUpCardIndex: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = facedUpCardIndex, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                facedUpCardIndex = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                facedUpCardIndex = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
        }
        cards.shuffle()
    }
}
