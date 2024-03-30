//
//  PhotosModal.swift
//  PhotoCollage
//
//  Created by Fahim on 3/30/24.
//

import SwiftUI
import PhotosUI

struct PhotosModal: View {
    @State private var selectedItems:[PhotosPickerItem] = []
    @Binding var card:Card
    var body: some View {
        PhotosPicker(selection: $selectedItems, matching: .images){
            ToolbarButton(modal: .photoModal)
        }.onChange(of: selectedItems){  items in
            for item in items{
                item.loadTransferable(type: Data.self){
                    result in
                    Task{
                        switch result{
                        case .success(let data):
                            if let data,
                               let uiImage = UIImage(data: data){
                                card.addElement(uiImage: uiImage)
                            }
                        case .failure(let failure):
                            fatalError("Image transfer is failed:\(failure)")
                        }

                    }
                }
            }
            selectedItems = []


        }

    }
}

struct PhotosModal_Previews: PreviewProvider {
    static var previews: some View {
        PhotosModal(card: .constant(Card()))
    }
}
