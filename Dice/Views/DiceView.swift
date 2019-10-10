// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct DiceView: View {

    @State var number = Int.random(in: 1...6)

    var body: some View {
        VStack(spacing: 50) {

            Text(String(self.number))
                .frame(width: 80, height: 80)
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .padding(20)
                .border(Color.red, width: 3)
                .background(Color.yellow)
                .shadow(radius: 10)

            Button("Würfeln") {
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
