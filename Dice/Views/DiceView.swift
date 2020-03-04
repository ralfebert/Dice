// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct DiceView: View {

    @State var number = Int.random(in: 1...6)

    var body: some View {
        VStack(spacing: 50) {
            Image("dice-\(number)")
            Button("Roll!") {
                self.number = Int.random(in: 1...6)
            }
        }
    }

}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}