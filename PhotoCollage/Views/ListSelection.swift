//
//  ListSelection.swift
//  PhotoCollage
//
//  Created by Fahim on 4/13/24.
//

import SwiftUI
enum ListState {
    case list, carousel
}

struct ListSelection: View {
    @Binding var listState: ListState

    var body: some View {
        Picker(selection: $listState, label: Text("")) {
            Image(systemName: "square.grid.2x2.fill")
                .tag(ListState.list)
            Image(systemName: "rectangle.stack.fill")
                .tag(ListState.carousel)
        }
        .pickerStyle(.segmented)
        .frame(width: 200)
    }
}

struct ListSelection_Previews: PreviewProvider {
    static var previews: some View {
        ListSelection(listState: .constant(.list))
    }
}
