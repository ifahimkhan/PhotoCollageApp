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
    @State private var previousRotation:Angle = .zero
    @State private var scale:CGFloat = 1.0


    let content = RoundedRectangle(cornerRadius: 30)
    let color = Color.red
    var body: some View {
        content
            .frame(width: transform.size.width,height: transform.size.height)
            .foregroundColor(color)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture,scaleGesture))

    }
    var scaleGesture: some Gesture{
        MagnificationGesture()
            .onChanged{
                scale in
                self.scale = scale
            }
            .onEnded{ scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0

            }
    }
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged{
                value in
                transform.offset = value.translation + previousOffset
            }.onEnded{_ in
                previousOffset = transform.offset
            }
    }
    var rotationGesture: some Gesture{
        RotationGesture()
            .onChanged{
                rotation in
                print(rotation)
                transform.rotation += rotation - previousRotation
                previousRotation = rotation

            }.onEnded{_ in
                previousRotation = .zero
            }
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView()
    }
}
