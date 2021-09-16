//
//  SetGameModelTests
//  SetGameTests
//
//  Created by Artur Shellunts on 23.07.21.
//

import XCTest
@testable import SetGame

class SetGameModelTests: XCTestCase {

	var cardsOnTable: Int!
	var deckSize: Int!
	var vm: SetGameModel!
	var dealMoreCards: Int!

	override func setUp() {
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
}
