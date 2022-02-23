import SwiftUI

struct ContentView: View {
    @State var diceNumber: Int = Int.random(in: 1 ... 6)

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "die.face.\(diceNumber).fill")
                .imageScale(.large)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.green)
                .font(.system(size: 100))
            Text("You rolled a \(diceNumber)")
                .bold()
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
