// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct DiceView: View {

    @State var dice = Dice()

    var body: some View {
        VStack(spacing: 50) {
            Text(String(dice.number))
                .font(.system(size: 100, weight: .bold))
            Button("Würfeln") {
                self.dice.roll()
            }
        }
    }

}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
