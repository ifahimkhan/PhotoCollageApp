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
    var imageFileName: String?
}

struct TextElement:CardElement {
    var id = UUID()
    var transform: Transform=Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "Gill Sans"
}
extension TextElement: Codable{
    enum CodingKeys: CodingKey{
        case text,transform, textColor, textFont
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transform = try container
            .decode(Transform.self, forKey: .transform)
        text = try container
            .decode(String.self, forKey: .text)
        let components = try container.decode([CGFloat].self, forKey: .textColor)
        textColor = Color.color(components: components)
        textFont = try container.decode(String.self, forKey: .textFont)
    }
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(textFont , forKey: .textFont)
        try container.encode(transform, forKey: .transform)
        try container.encode(textColor.colorComponents(), forKey: .textColor)

    }
}
/*
 extension TextElement: Codable {
     // CodingKeys enum to specify the keys used for encoding and decoding
     private enum CodingKeys: String, CodingKey {
         case id
         case transform
         case text
         case textColor
         case textFont
     }

     // Implementing the required initializer for decoding
     init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         id = try container.decode(UUID.self, forKey: .id)
         transform = try container.decode(Transform.self, forKey: .transform)
         text = try container.decode(String.self, forKey: .text)
         // Decoding textColor as a string and converting it back to Color
         let textColorString = try container.decode(String.self, forKey: .textColor)
         textColor = Color(textColorString)
         textFont = try container.decode(String.self, forKey: .textFont)
     }

     // Implementing the method for encoding
     func encode(to encoder: Encoder) throws {
         var container = encoder.container(keyedBy: CodingKeys.self)
         try container.encode(id, forKey: .id)
         try container.encode(transform, forKey: .transform)
         try container.encode(text, forKey: .text)
         // Encoding textColor as a string
         try container.encode(textColor.description, forKey: .textColor)
         try container.encode(textFont, forKey: .textFont)
     }
 }
*/
extension ImageElement: Codable{
    enum CodingKeys: CodingKey {
        case transform, imageFilename, frameIndex
    }
    init(from decoder: Decoder) throws {
        let container = try decoder
            .container(keyedBy: CodingKeys.self)
        transform = try container
            .decode(Transform.self, forKey: .transform)
        frameIndex = try container
            .decodeIfPresent(Int.self, forKey: .frameIndex)
        imageFileName = try container.decodeIfPresent(
              String.self,
              forKey: .imageFilename)
            if let imageFileName {
              uiImage = UIImage.load(uuidString: imageFileName)
            } else {
              uiImage = UIImage.errorImage
            }

    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(frameIndex, forKey: .frameIndex)
        try container.encode(imageFileName, forKey: .imageFilename)
    }
}
