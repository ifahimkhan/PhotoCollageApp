//
//  SingleCardView.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//

import SwiftUI

struct SingleCardView: View {  @Binding var card: Card
    @State private var currentModal: ToolbarSelection?
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                CardDetailView(
                    card: $card,
                    viewScale: Settings.calculateScale(proxy.size),
                    proxy: proxy)
                .frame(
                    width: Settings.calculateSize(proxy.size).width,
                    height: Settings.calculateSize(proxy.size).height)
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .modifier(CardToolbar(
                    currentModal: $currentModal,
                    card: $card))
                .onDisappear {
                    card.save()
                }
            }
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    struct SingleCardPreview: View {
        @EnvironmentObject var store: CardStore
        var body: some View {
            SingleCardView(card: $store.cards[0])
        }
    }
    static var previews: some View {
        SingleCardPreview()
            .environmentObject(CardStore(defaultData: true))
    }
}
