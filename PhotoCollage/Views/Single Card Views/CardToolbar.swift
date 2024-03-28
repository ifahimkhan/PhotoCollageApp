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
    func body(content: Content) -> some View {
        content
            .sheet(item: $currentModal){ item in
                switch item{
                case .stickerModal:
                    StickerModal()
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
                    BottomToolbar(modal: $currentModal)
                }
            }
    }
    
}
extension View {
    func cardToolbar(currentModal: Binding<ToolbarSelection?>) -> some View {
        modifier(CardToolbar(currentModal: currentModal))
    }
}

