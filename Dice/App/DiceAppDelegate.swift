// © 2019 Ralf Ebert — iOS Example Project: Dice
// License: https://opensource.org/licenses/MIT

import SwiftUI
import UIKit

@UIApplicationMain
class DiceAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        window.rootViewController = UIHostingController(rootView: DiceView())
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
