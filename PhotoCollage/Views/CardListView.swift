//
//  CardListView.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//
import SwiftUI

struct CardListView: View {
    @EnvironmentObject var store:CardStore
    @State private var selectedCard:Card?

    var body: some View {
        list.fullScreenCover(item: $selectedCard){ card in
            if let index = store.index(for: card){
                SingleCardView(card:$store.cards[index])
            }
        }.scrollIndicators(.hidden)
    }
    var list: some View{
        ScrollView{
            VStack{
                ForEach(store.cards,id:\.self.id){ card in
                    CardThumbnail(card:card).onTapGesture {
                        selectedCard = card
                    }
                }
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView().environmentObject(CardStore(defaultData: true))
    }
}


