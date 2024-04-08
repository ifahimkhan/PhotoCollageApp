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

    @EnvironmentObject var store:CardStore
    @State private var frameIndex: Int?
    @State private var textElement = TextElement()

    var menu: some View {
      // 1
      Menu {
        Button {
            Task {
                if UIPasteboard.general.hasImages {
                    if let images = UIPasteboard.general.images {
                        for image in images {
                            card.addElement(uiImage: image)
                        }
                    }
                } else if UIPasteboard.general.hasStrings {
                    if let strings = UIPasteboard.general.strings {
                        for text in strings {
                            card.addElement(text: TextElement(text: text))
                        }
                    }
                }
            }


        } label: {
          Label("Paste", systemImage: "doc.on.clipboard")
        }
    // 2
        .disabled(!UIPasteboard.general.hasImages
          && !UIPasteboard.general.hasStrings)
    } label: {
        Label("Add", systemImage: "ellipsis.circle")
      }
    }
    func body(content: Content) -> some View {
        content
            .sheet(item: $currentModal){ item in
                switch item{
                case .frameModal:
                    FrameModal(frameIndex: $frameIndex)
                        .onDisappear{
                            if let frameIndex {
                                card.update(store.selectedElement,frameIndex:frameIndex)
                            }
                            frameIndex = nil
                        }

                case .stickerModal:
                    StickerModal(stickerImage: $stickerImage)
                        .onDisappear{
                            if let stickerImage = stickerImage{
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                case .textModal:
                    TextModal(textElement: $textElement)
                        .onDisappear{
                            if !textElement.text.isEmpty{
                                card.addElement(text: textElement)
                            }
                            textElement = TextElement()
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
                ToolbarItem(placement: .navigationBarTrailing){
                    menu
                }
                /*ToolbarItem(placement: .navigationBarLeading){
                 PasteButton(payloadType: CustomTransfer.self){ data in
                 Task{
                 card.addElements(from: data )


                 }
                 }
                 .labelStyle(.iconOnly)
                 .buttonBorderShape(.capsule)
                 }*/
            }
    }

}
extension View {
    func cardToolbar(currentModal: Binding<ToolbarSelection?>, card:Binding<Card>) -> some View {
        modifier(CardToolbar(currentModal: currentModal,card: card))
    }
}

