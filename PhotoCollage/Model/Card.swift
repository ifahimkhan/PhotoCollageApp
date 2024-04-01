//
//  Card.swift
//  PhotoCollage
//
//  Created by Fahim on 3/26/24.
//

import SwiftUI

struct Card:Identifiable{
    let id = UUID()
    var backgroundColor:Color = .yellow
    var elements: [CardElement] = []

    mutating func addElement(uiImage: UIImage){
        let element:CardElement = ImageElement(uiImage:uiImage)
        elements.append(element)
    }
    mutating func addElement(text: TextElement) {
        elements.append(text)
    }
    mutating func remove(_ element: CardElement) {
        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
    }
    mutating func addElements(from transfer: [CustomTransfer]) {
        for element in transfer {
            if let text = element.text {
                addElement(text: TextElement(text: text))
            } else if let image = element.image {
                addElement(uiImage: image)
            }
        }
    }
    mutating func update(_ element: CardElement?, frameIndex: Int) {
        if let element = element as? ImageElement,
           let index = element.index(in: elements) {
            var newElement = element
            newElement.frameIndex = frameIndex
            elements[index] = newElement
        } }

}
