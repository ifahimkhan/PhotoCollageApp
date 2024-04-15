//
//  Card.swift
//  PhotoCollage
//
//  Created by Fahim on 3/26/24.
//

import SwiftUI

struct Card:Identifiable{
    var id = UUID()
    var backgroundColor:Color = .yellow
    var elements: [CardElement] = []
    var uiImage: UIImage?

    mutating func addElement(uiImage: UIImage, at offset: CGSize = .zero) {
        let imageFilename = uiImage.save()
        let transform = Transform(offset: offset)
        let element = ImageElement(
            transform: transform,
            uiImage: uiImage,
            imageFileName: imageFilename)
        elements.append(element)
        save()
    }
    mutating func addElement(text: TextElement) {
        elements.append(text)
    }
    mutating func remove(_ element: CardElement) {
        if let element = element as? ImageElement{
            UIImage.remove(name: element.imageFileName)
        }
        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
    }
    mutating func addElements(from transfer: [CustomTransfer], at offset: CGSize) {
        for element in transfer {
            if let text = element.text {
                addElement(text: TextElement(text: text))
            } else if let image = element.image {
                addElement(uiImage: image, at: offset)
            }
        }
    }
    mutating func update(_ element: CardElement?, frameIndex: Int) {
        if let element = element as? ImageElement,
           let index = element.index(in: elements) {
            var newElement = element
            newElement.frameIndex = frameIndex
            elements[index] = newElement
        }
    }
    func save() {
        print("Saving data")
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            let filename = "\(id).rwcard"
            let url = URL.documentsDirectory.appendingPathComponent(filename)
            try data.write(to: url)
        }catch{
            print(error.localizedDescription)
        }
    }

}
extension Card: Codable{
    enum CodingKeys:CodingKey{
        case id, backgroundColor, imageElements, textElements
    }
    init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: id) ?? UUID()
        elements += try container.decode([ImageElement].self, forKey: .imageElements)

        let bgColor = try container.decode([CGFloat].self, forKey: .backgroundColor)
        self.backgroundColor = Color.color(components: bgColor)
        elements += try container.decode([TextElement].self, forKey: .textElements)

    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id.uuidString, forKey: .id)
        let imageElements: [ImageElement] =
        elements.compactMap { element in
            element as? ImageElement
        }
        try container.encode(imageElements, forKey: .imageElements)

        try container.encode(backgroundColor.colorComponents(), forKey: .backgroundColor)
        let textElements = elements.compactMap{
            element in
            element as? TextElement
        }
        try container.encode(textElements,forKey: .textElements)
    }
}
