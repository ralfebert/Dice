// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import Foundation

protocol DiceDelegate: AnyObject {
    func onStartDiceRoll()
    func onDiceRolled()
}

class Dice {

    enum DiceState {
        case initial
        case number(number: Int)
        case rolling
    }

    private let range: ClosedRange<Int>
    var state = DiceState.initial
    weak var delegate: DiceDelegate?

    init(max: Int = 6) {
        self.range = 1 ... max
    }

    func roll() {
        precondition(Thread.isMainThread)
        switch self.state {
            case .initial, .number:
                self.state = .rolling
                self.delegate?.onStartDiceRoll()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.state = .number(number: self.range.randomElement()!)
                    self.delegate?.onDiceRolled()
                }
            case .rolling:
                // do nothing, already rolling
                break
        }
    }

}
