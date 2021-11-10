import SwiftUI

struct DiceView: View {
    @State var diceNumber: Int?

    var body: some View {
        VStack(spacing: 15) {
            if let diceNumber = diceNumber {
                Image(systemName: "die.face.\(diceNumber).fill")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.green)
                    .imageScale(.large)
                    .font(.system(size: 100))
                Text("You rolled a \(diceNumber)")
                    .bold()
            }

            Button("Roll!") {
                self.diceNumber = Int.random(in: 1 ... 6)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
