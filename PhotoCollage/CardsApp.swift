import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore(defaultData: true)

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



