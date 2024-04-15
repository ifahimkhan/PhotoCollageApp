//
//  TextModal.swift
//  PhotoCollage
//
//  Created by Fahim on 4/9/24.
//

import SwiftUI

struct TextModal: View {
    @Environment(\.dismiss) var dismiss
    @Binding var textElement: TextElement

    var body: some View {
        let onCommit = {
            dismiss()
        }
        VStack {
            TextField(
                "Enter text",
                text: $textElement.text,
                onCommit: onCommit)
            .font(.custom(textElement.textFont, size: 30))
            .foregroundColor(textElement.textColor)
            .padding(40)
            TextView(
                font: $textElement.textFont,
                color: $textElement.textColor)
        }
    }
}

struct TextModal_Previews: PreviewProvider {
    static var previews: some View {
        TextModal(textElement: .constant(TextElement()))
    }
}
