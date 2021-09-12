//
//  SetGameViewModel.swift
//  Set game
//
//  Created by Artur Shellunts on 11.09.21.
//

import Foundation

class SetGameModel {

	init(deckSize: Int, cardsOnTable: Int) {

		for _ in 0..<deckSize {
			let card = Card.newRandom()
			self.deck.append(card)
		}

		dealMore(cardsOnTable)
	}

	func dealMore() {
		dealMore(3)
	}

	func toggleCardSelection(index: Int) {
		if (cardsOnTable[index].isMatched) {
			return
		}
		cardsOnTable[index].isSelected = !cardsOnTable[index].isSelected
		checkMatching()
	}

	private func checkMatching() {
		if countOfSelectedCardsNotMatched == 3 {
			for i in cardsOnTable.indices {
				cardsOnTable[i].isMatched = cardsOnTable[i].isSelected
			}
		}
	}

	private var countOfSelectedCardsNotMatched: Int {
		return cardsOnTable.filter{ $0.isSelected && !$0.isMatched }.count
	}

	private func dealMore(_ cards: Int) {
		for _ in 0..<cards {
			cardsOnTable.append(deck.remove(at: 0))
		}
	}

	private(set) var cardsOnTable = [Card]()
	private(set) var deck = [Card]()
}
