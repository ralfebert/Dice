import SwiftUI

struct ContentView: View {
    @State var number: Int?

    var body: some View {
        VStack(spacing: 20) {
            if let number = number {
                Image("dice-\(number)")
            }
            Button("Würfeln") {
                self.number = Int.random(in: 1 ... 6)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
