import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore(defaultData: false)
    var body: some Scene {
        WindowGroup {
            CardsListView()
                .onAppear {
                    print(URL.documentsDirectory)
                }
                .environmentObject(store)
        }
    }
}



