//
//  Card.swift
//  Set game
//
//  Created by Artur Shellunts on 11.09.21.
//

import Foundation

func randomEnum(_ values: [Any]) -> Any {
	let i = Int.random(in: 0..<values.count)
	return values[i];
}

enum Shape {
	case circle
	case square
	case triangle
	static func random() -> Shape {
		return randomEnum([Shape.circle, .square, .triangle]) as! Shape
	}
}

enum Color {
	case red
	case green
	case blue
	static func random() -> Color {
		return randomEnum([Color.red, .green, .blue]) as! Color
	}
}

enum Texture {
	case filled
	case shaded
	case outline
	static func random() -> Texture {
		return randomEnum([Texture.filled, .shaded, .outline]) as! Texture
	}
}

struct Card {
	//var isHidden: Bool = true
	var isSelected: Bool
	var isMatched: Bool
	var shape: Shape
	var count: Int
	var color: Color
	var texture: Texture

	static func newRandom() -> Card {
		return Card(isSelected: false,
					isMatched: false,
					shape: Shape.random(),
					count: Int.random(in: 1...3),
					color: Color.random(),
					texture: Texture.random())
	}

	var text: String {
		return "fix-me"
	}
}
