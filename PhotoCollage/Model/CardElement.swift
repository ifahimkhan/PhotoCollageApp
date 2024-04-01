//
//  CardElement.swift
//  PhotoCollage
//
//  Created by Fahim on 3/26/24.
//

import SwiftUI

protocol CardElement
{
    var id: UUID{get}
    var transform:Transform { get set}

}
extension CardElement{
    func index(in array:[CardElement]) -> Int?{
        array.firstIndex{
            $0.id == id
        }
    }
}
struct ImageElement: CardElement{
    let id = UUID()
    var transform = Transform()
    var image:Image{
        Image(uiImage: self.uiImage ?? UIImage(named: "error-Image")!)
    }
    var uiImage:UIImage?
    var frameIndex: Int?
}

struct TextElement:CardElement {
    var id = UUID()
    var transform: Transform=Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "Gill Sans"
}
