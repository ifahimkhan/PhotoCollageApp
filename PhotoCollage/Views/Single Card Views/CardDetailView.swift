//
//  CardDetailView.swift
//  PhotoCollage
//
//  Created by Fahim on 3/27/24.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var store:CardStore
    @Binding var card:Card
    var body: some View {
        ZStack {
            card.backgroundColor
            ForEach($card.elements,id: \.id){
                $element in
                CardElementView(element: element)
                    .resizableView(transform: $element.transform)
                    .frame(width: element.transform.size.width,
                           height: element.transform.size.height)

            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    struct CardDetailPreview: View{
        @EnvironmentObject var store:CardStore
        var body: some View{
            CardDetailView(card: $store.cards[0])
        }


    }

    static var previews: some View {
        CardDetailView(card: .constant(initialCards[0]))
            .environmentObject(CardStore(defaultData: true))
    }
}
