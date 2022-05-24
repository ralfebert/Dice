import SwiftUI

struct Dice: Identifiable {
    let id = UUID()
    let number = Int.random(in: 1 ... 6)
    let rotation = Double.random(in: -5 ... 5)
}

struct DiceRoll {
    let dice: [Dice]

    init(count: Int) {
        dice = Array(1 ... count).map { _ in Dice() }
    }

    var totalNumber: Int {
        dice.map { $0.number }.reduce(0, +)
    }
}

struct ContentView: View {
    @State var diceRoll: DiceRoll?
    @AppStorage("DiceCount") var diceCount: Int = 2

    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                if let diceRoll = self.diceRoll {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(diceRoll.dice) { dice in
                            Image(systemName: "die.face.\(dice.number).fill")
                                .imageScale(.large)
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.green)
                                .font(.system(size: 100))
                                .rotationEffect(.degrees(dice.rotation))
                        }
                    }
                    Text("You rolled \(diceRoll.totalNumber).")
                        .font(.largeTitle)
                }

                HStack {
                    Stepper("Dice count", value: $diceCount, in: 1 ... 6)
                        .labelsHidden()

                    Button(
                        action: {
                            self.diceRoll = DiceRoll(count: diceCount)
                        },
                        label: {
                            Image(systemName: "shuffle")
                        }
                    )
                    .buttonStyle(.borderedProminent)
                }
            }
            .onAppear {
                self.diceRoll = DiceRoll(count: diceCount)
            }
            .onChange(of: self.diceCount) { _ in
                self.diceRoll = DiceRoll(count: diceCount)
            }
            .navigationTitle("Dice")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
