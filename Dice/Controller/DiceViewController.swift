// © 2020 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet var diceImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollDice(_: Any) {
        let number = (1 ... 6).randomElement()!
        self.diceImageView.image = UIImage(named: "dice-\(number)")
    }

}
