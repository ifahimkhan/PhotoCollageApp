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
