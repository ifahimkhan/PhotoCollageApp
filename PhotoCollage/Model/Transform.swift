//
//  Transform.swift
//  PhotoCollage
//
//  Created by Fahim on 3/23/24.
//

import SwiftUI

struct Transform {
    var size:CGSize = CGSize(width: Settings.defaultElementSize.width, height: Settings.thumbnailSize.height)
    var rotation:Angle = .zero
    var offset:CGSize = .zero

}
extension Transform: Codable{

}
