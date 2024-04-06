import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore()
    var body: some Scene {
        WindowGroup {
            CardListView()
                .onAppear {
                    print(URL.documentsDirectory)
                }
                .environmentObject(store)
        }
    }
}



