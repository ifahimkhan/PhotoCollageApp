//
//  PhotosModal.swift
//  PhotoCollage
//
//  Created by Fahim on 3/30/24.
//

import SwiftUI
import PhotosUI

struct PhotosModal: View {
    @State private var selectedCard:[PhotosPickerItem] = []
    @Binding var card:Card
    var body: some View {
        PhotosPicker(selection: $selectedCard, matching: .images){
            ToolbarButton(modal: .photoModal)
        }

    }
}

struct PhotosModal_Previews: PreviewProvider {
    static var previews: some View {
        PhotosModal(card: .constant(Card()))
    }
}
