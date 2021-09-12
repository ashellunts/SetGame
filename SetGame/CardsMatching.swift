//
//  CardsMatching.swift
//  SetGame
//
//  Created by Artur Shellunts on 12.09.21.
//

import Foundation

func valuesMatching<Type: Equatable>(_ value1: Type, _ value2: Type, _ value3: Type) -> Bool {
	let allSameShape = value1 == value2 && value2 == value3
	let allDifferentShape = value1 != value2 && value2 != value3 && value3 != value1

	return allSameShape || allDifferentShape
}

func CardsMatching(_ card1: Card, _ card2: Card, _ card3: Card) -> Bool {
	return
		valuesMatching(card1.shape, 	card2.shape, 	card3.shape) &&
		valuesMatching(card1.count, 	card2.count, 	card3.count) &&
		valuesMatching(card1.color, 	card2.color, 	card3.color) &&
		valuesMatching(card1.texture, 	card2.texture, 	card3.texture)
}
