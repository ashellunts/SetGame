//
//  CardsMatchingTest.swift
//  SetGameTests
//
//  Created by Artur Shellunts on 12.09.21.
//

import XCTest
@testable import SetGame

class ValuesMatchingTest : XCTestCase {

	func testMatchSameValue() throws {
		let value1 = Shape.circle
		let value2 = value1
		let value3 = value1

		XCTAssert(valuesMatching(value1, value2, value3))
	}

	func test2SameValuesAnd1DifferentDoNotMatch_Order1() throws {
		let value1 = Shape.circle
		let value2 = Shape.circle
		let value3 = Shape.square

		XCTAssertFalse(valuesMatching(value1, value2, value3))
	}

	func test2SameValuesAnd1DifferentDoNotMatch_Order2() throws {
		let value1 = Shape.square
		let value2 = Shape.circle
		let value3 = Shape.square

		XCTAssertFalse(valuesMatching(value1, value2, value3))
	}

	func test3DifferentValuesMatch() throws {
		let value1 = Shape.circle
		let value2 = Shape.triangle
		let value3 = Shape.square

		XCTAssert(valuesMatching(value1, value2, value3))
	}
}
