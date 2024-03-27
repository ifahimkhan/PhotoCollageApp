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
            CardDetailView(card: $card)
                .cardToolbar(currentModal: $currentModal)
        }
    }

}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(card: .constant(initialCards[0]))
    }
}
