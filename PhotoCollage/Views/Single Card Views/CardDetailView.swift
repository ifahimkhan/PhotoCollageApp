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
            card.backgroundColor.onTapGesture {
                store.selectedElement = nil
            }
            ForEach($card.elements,id: \.id){
                $element in
                CardElementView(element: element)
                    .border(
                        Settings.borderColor,
                        width: isSelected(element) ? Settings.borderWidth : 0)
                
                    .onTapGesture{
                        store.selectedElement = element
                    }
                    .elementContextMenu(
                        card: $card,
                        element: $element)
                    .resizableView(transform: $element.transform)
                    .frame(
                        width: element.transform.size.width,
                        height: element.transform.size.height)
            }
        }
        .onDisappear {
            store.selectedElement = nil
        }.dropDestination(for:CustomTransfer.self){
            customTransfer, location in
            print("location: \(location)")
            Task{
                card.addElements(from: customTransfer)
            }
            return !customTransfer.isEmpty
        }
    }
    func isSelected(_ element: CardElement) -> Bool{
        store.selectedElement?.id == element.id
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
