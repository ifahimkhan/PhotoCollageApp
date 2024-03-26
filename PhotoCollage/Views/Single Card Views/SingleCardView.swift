//
//  SingleCardView.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//

import SwiftUI

struct SingleCardView: View {
    @State private var currentModal: ToolbarSelection?
    
    var body: some View {
        NavigationStack {
            content
                .cardToolbar(currentModal: $currentModal)
        }
    }
    var content: some View{
        ZStack{
            Group{
                Capsule()
                    .foregroundColor(.yellow)
                Text("Resize Me!")
                    .fontWeight(.bold)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }.resizableView()
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView()
    }
}
