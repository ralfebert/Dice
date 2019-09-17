// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

}
