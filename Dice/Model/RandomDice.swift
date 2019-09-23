// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

struct RandomDice {

    private(set) var number: Int
    private let range: ClosedRange<Int>

    init(upperBound: Int = 6) {
        self.range = 1 ... upperBound
        self.number = Int.random(in: self.range)
    }

    mutating func roll() {
        self.number = Int.random(in: self.range)
    }

}
