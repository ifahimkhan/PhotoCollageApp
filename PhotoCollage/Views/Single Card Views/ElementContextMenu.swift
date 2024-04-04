//
//  ElementContextMenu.swift
//  PhotoCollage
//
//  Created by Fahim on 3/31/24.
//

import SwiftUI

struct ElementContextMenu: ViewModifier {
    @Binding var card: Card
    @Binding var element: CardElement

    func body(content: Content) -> some View {
        content.contextMenu{
            Button {
                if let element = element as? TextElement {
                    UIPasteboard.general.string = element.text
                } else if let element = element as? ImageElement,
                          let image = element.uiImage {
                    UIPasteboard.general.image = image
                }
            } label: {
                Label("Copy", systemImage: "doc.on.doc")
            }
            Button(role: .destructive) {
                card.remove(element)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

extension View {
    func elementContextMenu(
        card: Binding<Card>,
        element: Binding<CardElement>
    ) -> some View {
        modifier(ElementContextMenu(
            card: card,
            element: element))
    }
}
