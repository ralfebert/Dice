import SwiftUI

struct DiceView: View {
    let diceNumber = Int.random(in: 1 ... 6)

    var body: some View {
        VStack(spacing: 15) {
            Image("dice-\(diceNumber)")
            Text("You rolled a \(diceNumber)")
                .bold()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
