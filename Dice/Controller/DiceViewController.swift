// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import UIKit

class DiceViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var btnDice: UIButton!

    // MARK: - Lebenszyklus

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func rollDice() {
        let nr = (1 ... 6).randomElement()!
        self.lblNumber.text = String(nr)
    }

    // MARK: - Detect shake

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        if motion == .motionShake {
            self.rollDice()
        }
    }

}
