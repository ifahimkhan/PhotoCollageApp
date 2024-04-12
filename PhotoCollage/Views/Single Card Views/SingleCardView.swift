//
//  SingleCardView.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//

import SwiftUI

struct SingleCardView: View {
    @State private var currentModal: ToolbarSelection?
    @Binding var card:Card
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                CardDetailView(card: $card,viewScale: Settings.calculateScale(proxy.size),proxy: proxy)
                    .frame(
                        width: Settings.calculateSize(proxy.size).width,
                        height: Settings.calculateSize(proxy.size).height)
                    .clipped()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .scaleEffect(0.8)
                    .cardToolbar(currentModal: $currentModal,card: $card).onDisappear{
                        card.save()
                    }
            }
        }
    }

}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(card: .constant(initialCards[0]))
    }
}
