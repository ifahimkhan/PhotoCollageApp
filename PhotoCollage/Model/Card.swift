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

}
