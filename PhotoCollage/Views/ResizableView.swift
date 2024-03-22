//
//  ResizableView.swift
//  PhotoCollage
//
//  Created by Ragesh on 3/23/24.
//

import SwiftUI

struct ResizableView: View {

    @State private var transform:Transform = Transform()
    @State private var previousOffset:CGSize = .zero

    let content = RoundedRectangle(cornerRadius: 30)
    let color = Color.red
    var body: some View {
        content
            .frame(width: transform.size.width,height: transform.size.height)
            .foregroundColor(color)
            .offset(transform.offset)
            .gesture(dragGesture)
    }
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged{
                value in
                transform.offset = CGSize(width: value.translation.width + previousOffset.width, height: value.translation.height + previousOffset.height)
            }.onEnded{_ in
                previousOffset = transform.offset
            }
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView()
    }
}
