//
//  Set_gameTests.swift
//  Set gameTests
//
//  Created by Artur Shellunts on 23.07.21.
//

import XCTest
@testable import SetGame

class SetGameTests: XCTestCase {

	var cardsOnTable: Int!
	var deckSize: Int!
	var vm: SetGameModel!
	var dealMoreCards: Int!

	override func setUpWithError() throws {
		cardsOnTable = 12
		deckSize = 81
		dealMoreCards = 3
		vm = SetGameModel(deckSize: deckSize, cardsOnTable: cardsOnTable)
	}

	func testInitialCountOfCardsOnTable() throws {
		XCTAssertEqual(cardsOnTable, vm.cardsOnTable.count)
		XCTAssertEqual(deckSize - cardsOnTable, vm.deck.count)
	}

	func testDealMore() throws {
		vm.dealMore()
		XCTAssertEqual(cardsOnTable + dealMoreCards, vm.cardsOnTable.count)
	}

	func testSelectCard() throws {
		vm.toggleCardSelection(index: 0)
		XCTAssert(vm.cardsOnTable[0].isSelected)

		vm.toggleCardSelection(index: 0)
		XCTAssertFalse(vm.cardsOnTable[0].isSelected)
	}

	func testMatch() throws {
		vm.toggleCardSelection(index: 0)
		vm.toggleCardSelection(index: 1)
		vm.toggleCardSelection(index: 2)
		XCTAssert(vm.cardsOnTable[0].isMatched)
		XCTAssert(vm.cardsOnTable[1].isMatched)
		XCTAssert(vm.cardsOnTable[2].isMatched)

		//matched card can't be deselected
		vm.toggleCardSelection(index: 0)
		XCTAssert(vm.cardsOnTable[0].isSelected)

		vm.toggleCardSelection(index: 3)
		vm.toggleCardSelection(index: 4)
		vm.toggleCardSelection(index: 5)
		XCTAssert(vm.cardsOnTable[3].isMatched)
		XCTAssert(vm.cardsOnTable[4].isMatched)
		XCTAssert(vm.cardsOnTable[5].isMatched)
	}
}
