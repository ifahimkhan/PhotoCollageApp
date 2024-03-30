//
//  CardToolbar.swift
//  PhotoCollage
//
//  Created by Fahim on 3/26/24.
//

import SwiftUI

struct CardToolbar: ViewModifier{
    @Environment(\.dismiss) var dismiss
    @Binding var currentModal: ToolbarSelection?
    @Binding var card:Card
    @State private var stickerImage:UIImage?
    func body(content: Content) -> some View {
        content
            .sheet(item: $currentModal){ item in
                switch item{
                
                case .stickerModal:
                    StickerModal(stickerImage: $stickerImage)
                        .onDisappear{
                            if let stickerImage = stickerImage{
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                default:
                    Text(String(describing: item))
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .bottomBar){
                    BottomToolbar(modal: $currentModal,card: $card)
                }
            }
    }
    
}
extension View {
    func cardToolbar(currentModal: Binding<ToolbarSelection?>, card:Binding<Card>) -> some View {
        modifier(CardToolbar(currentModal: currentModal,card: card))
    }
}

