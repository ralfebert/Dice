import SwiftUI

struct ContentView: View {
    let diceNumber = Int.random(in: 1 ... 6)

    var body: some View {
        VStack(spacing: 15) {
            Image("dice-\(diceNumber)")
            Text("You rolled a \(diceNumber)")
                .bold()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
