import SwiftUI

struct ContentView: View {
    @State var diceNumber: Int?

    var body: some View {
        VStack(spacing: 15) {
            if let diceNumber = self.diceNumber {
                Image(systemName: "die.face.\(diceNumber)")
                    .imageScale(.large)
                    .font(.system(size: 50))
                Text("You rolled a \(diceNumber)")
                    .bold()
            }
            Button("Roll the Dice!") {
                self.diceNumber = Int.random(in: 1 ... 6)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
