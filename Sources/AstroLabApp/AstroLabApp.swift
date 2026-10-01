import SwiftUI

@main
struct AstroLabApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        Settings {
            Text("AstroLab Settings")
                .padding()
        }
    }
}
