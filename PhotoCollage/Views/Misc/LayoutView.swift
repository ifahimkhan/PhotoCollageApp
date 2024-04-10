//
//  LayoutView.swift
//  PhotoCollage
//
//  Created by Ragesh on 4/10/24.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.red)
            Text("Hello, World!")
                .padding()
                .background(Color.red)
        }.background(Color.gray)
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView().previewLayout(.fixed(width: 500, height: 300))
    }
}
