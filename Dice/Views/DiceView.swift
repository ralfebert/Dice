// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct DiceView: View {

    @EnvironmentObject var dice: Dice

    var body: some View {
        VStack(spacing: 50) {

            if isLucky {
                Text("Glückstreffer!")
            }

            buildDiceView()

            Button("Würfeln") {
                self.dice.roll()
            }
        }
    }

    var isLucky: Bool {
        if case let .number(nr) = self.dice.state, nr == 6 {
            return true
        } else {
            return false
        }
    }

    func buildDiceView() -> AnyView {
        // This method + return type anyView is a workaround for
        // Closure containing control flow statement cannot be used with function builder 'ViewBuilder'
        // https://stackoverflow.com/questions/56736466/alternative-to-switch-statement-in-swiftui-viewbuilder-block
        // https://forums.swift.org/t/function-builders/25167/349
        switch self.dice.state {
            case .initial:
                return AnyView(EmptyView())
            case let .number(number):
                return
                    AnyView(Text(String(number))
                        .font(.system(size: 100, weight: .bold)))
            case .rolling:
                return AnyView(ActivityIndicator())
        }
    }

}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
