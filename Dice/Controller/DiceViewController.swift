// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import UIKit

class DiceViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var btnDice: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    // MARK: - Zustand

    var dice: Dice!

    // MARK: - Lebenszyklus

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dice = Dice()
        self.dice.delegate = self
        self.dice.roll()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch self.dice.state {
            case .initial:
                // do nothing
                break
            case let .number(number):
                self.activityIndicator.stopAnimating()
                self.lblNumber.text = String(number)
            case .rolling:
                self.activityIndicator.startAnimating()
                self.lblNumber.text = ""
        }
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

extension DiceViewController: DiceDelegate {

    func onStartDiceRoll() {
        self.view.setNeedsLayout()
    }

    func onDiceRolled() {
        self.view.setNeedsLayout()
    }

}
