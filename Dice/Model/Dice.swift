// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import Foundation

class Dice {

    typealias OnChange = () -> Void

    enum DiceState {
        case initial
        case number(number: Int)
        case rolling
    }

    private let range: ClosedRange<Int>
    private(set) var state = DiceState.initial {
        didSet {
            self.onChange?()
        }
    }

    var onChange: OnChange?

    init(max: Int = 6) {
        self.range = 1 ... max
    }

    func roll() {
        precondition(Thread.isMainThread)
        switch self.state {
            case .initial, .number:
                self.state = .rolling
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.state = .number(number: self.range.randomElement()!)
                }
            case .rolling:
                // do nothing, already rolling
                break
        }
    }

}
