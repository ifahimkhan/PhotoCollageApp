import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore(defaultData: true)

    var body: some Scene {
        WindowGroup {
            CardListView()
                .environmentObject(store)
        }
    }
}
