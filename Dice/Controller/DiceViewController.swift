// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import UIKit

class DiceViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var btnDice: UIButton!

    // MARK: - Zustand

    var dice = RandomDice() {
        didSet {
            self.view.setNeedsLayout()
        }
    }

    // MARK: - Lebenszyklus

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.lblNumber.text = String(self.dice.number)
    }

    // MARK: - Actions

    @IBAction func rollDice() {
        self.dice.roll()
    }

    // MARK: - Detect shake

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        if motion == .motionShake {
            self.dice.roll()
        }
    }

}
