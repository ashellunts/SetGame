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

	//TODO test
	private func checkMatching() {
		if selectedCardsNotMatched.count != 3 {
			return
		}

		if !CardsMatching(selectedCardsNotMatched[0], selectedCardsNotMatched[1], selectedCardsNotMatched[2]) {
			return
		}

		for i in cardsOnTable.indices {
			if (cardsOnTable[i].isSelected && !cardsOnTable[i].isMatched)
			{
				cardsOnTable[i].isMatched = true
			}
		}
	}

	private var selectedCardsNotMatched: [Card] {
		return cardsOnTable.filter{ $0.isSelected && !$0.isMatched }
	}

	private func dealMore(_ cards: Int) {
		for _ in 0..<cards {
			cardsOnTable.append(deck.remove(at: 0))
		}
	}

	private(set) var cardsOnTable = [Card]()
	private(set) var deck = [Card]()
}
