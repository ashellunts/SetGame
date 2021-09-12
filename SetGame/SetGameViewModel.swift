//
//  SetGameViewModel.swift
//  Set game
//
//  Created by Artur Shellunts on 11.09.21.
//

import Foundation

class SetGameModel {

	init(cardsCount: Int, cardsInitialCount: Int) {

		self.cards = Array(repeating: Card(isVisible: false), count:cardsCount)
	}

	private(set) var cards: [Card]
}
