//
//  CardsMatchingTest.swift
//  SetGameTests
//
//  Created by Artur Shellunts on 12.09.21.
//

import XCTest
@testable import SetGame

class CardsMatchingTest : XCTestCase {
	func testMatch() throws {
		let card1 = Card(isSelected: true, isMatched: false, shape: .circle, count: 1, color: .blue, texture: .filled)
		let card2 = Card(isSelected: true, isMatched: false, shape: .circle, count: 2, color: .blue, texture: .outline)
		let card3 = Card(isSelected: true, isMatched: false, shape: .circle, count: 3, color: .blue, texture: .shaded)

		XCTAssert(CardsMatching(card1, card2, card3))
	}

	func testColorNotMatching() throws {
		let card1 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card2 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .green, texture: .filled)
		let card3 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)

		XCTAssertFalse(CardsMatching(card1, card2, card3))
	}

	func testCountNotMatching() throws {
		let card1 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card2 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card3 = Card(isSelected: true, isMatched: false, shape: .square, count: 2, color: .blue, texture: .filled)

		XCTAssertFalse(CardsMatching(card1, card2, card3))
	}

	func testShapeNotMatching() throws {
		let card1 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card2 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card3 = Card(isSelected: true, isMatched: false, shape: .circle, count: 1, color: .blue, texture: .filled)

		XCTAssertFalse(CardsMatching(card1, card2, card3))
	}

	func testTextureNotMatching() throws {
		let card1 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card2 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .filled)
		let card3 = Card(isSelected: true, isMatched: false, shape: .square, count: 1, color: .blue, texture: .shaded)

		XCTAssertFalse(CardsMatching(card1, card2, card3))
	}
}
