// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct DiceView: View {

    @State var dice = RandomDice()

    var body: some View {
        VStack(spacing: 50) {

            Text(String(dice.number))
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .padding(20)
                .border(Color.red, width: 3)
                .background(Color.yellow)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

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
