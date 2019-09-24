// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

struct RandomDice {

    var number: Int
    private let range: ClosedRange<Int>

    init(max: Int = 6) {
        self.range = 1 ... max
        self.number = self.range.randomElement()!
    }

    mutating func roll() {
        self.number = self.range.randomElement()!
    }

}
