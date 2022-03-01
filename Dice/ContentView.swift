import SwiftUI

struct Dice: Identifiable {
    let id = UUID()
    let number = Int.random(in: 1 ... 6)
}

struct DiceRoll {
    let dice: [Dice] = [Dice(), Dice()]

    var totalNumber: Int {
        dice.map { $0.number }.reduce(0, +)
    }
}

struct ContentView: View {
    @State var diceRoll: DiceRoll?

    var body: some View {
        VStack(spacing: 15) {
            if let diceRoll = self.diceRoll {
                HStack {
                    ForEach(diceRoll.dice) { dice in
                        Image(systemName: "die.face.\(dice.number).fill")
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.green)
                            .font(.system(size: 100))
                    }
                }
                Text("\(diceRoll.dice.map { String($0.number) }.formatted()) → \(diceRoll.totalNumber)")
                    .bold()
            }
            Button("Roll the Dice!") {
                self.diceRoll = DiceRoll()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
