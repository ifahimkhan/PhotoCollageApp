//
//  AngleExtensions.swift
//  PhotoCollage
//
//  Created by Fahim on 4/4/24.
//

import SwiftUI

extension Angle: Codable{
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(degrees, forKey: .degrees)
    }


    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let degrees = try container.decode(Double.self, forKey: .degrees)
        self.init(degrees: degrees)

    }


}
enum CodingKeys: CodingKey{
    case degrees
}
