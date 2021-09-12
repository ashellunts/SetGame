//
//  ViewController.swift
//  Set game
//
//  Created by Artur Shellunts on 23.07.21.
//

import UIKit

class ViewController: UIViewController {

	var vm = SetGameModel(deckSize: 81, cardsOnTable: 12)

	@IBOutlet var buttons: [UIButton]!

	override func viewDidLoad() {
		super.viewDidLoad()

		for b in buttons {
			b.isHidden = true
			b.layer.cornerRadius = 5.0
		}

		updateUI()
	}

	@IBAction func dealMoreCards(_ sender: UIButton) {
		vm.dealMore()
		updateUI()
	}

	@IBAction func cardClick(_ sender: UIButton) {
		if let index = buttons.firstIndex(of: sender) {
			vm.toggleCardSelection(index: index)
			updateUI()
		}
	}

	func updateUI() {
		for i in vm.cardsOnTable.indices {
			buttons[i].isHidden = false

			if (vm.cardsOnTable[i].isMatched) {
				buttons[i].alpha = 0.5
			}

			if (vm.cardsOnTable[i].isSelected) {
				buttons[i].layer.borderColor = UIColor.blue.cgColor
				buttons[i].layer.borderWidth = 3.0
			}
			else {
				buttons[i].layer.borderColor = nil
				buttons[i].layer.borderWidth = 0
			}
		}
	}
}
