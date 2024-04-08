//
//  TextModal.swift
//  PhotoCollage
//
//  Created by Ragesh on 4/9/24.
//

import SwiftUI

struct TextModal: View {
    @Environment(\.dismiss) var dismiss
    @Binding var textElement: TextElement
    var body: some View {
        let commit = {
            dismiss()
        }
        TextField("Enter Text ",text: $textElement.text,onCommit: commit)
            .padding(20)
    }
}

struct TextModal_Previews: PreviewProvider {
    static var previews: some View {
        TextModal(textElement: .constant(TextElement()))
    }
}
