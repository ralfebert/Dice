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
        let nr = Int.random(in: 1 ... 6)
        self.lblNumber.text = String(nr)
    }

}
