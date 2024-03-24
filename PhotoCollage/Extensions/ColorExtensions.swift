//
//  ColorExtensions.swift
//  PhotoCollage
//
//  Created by Fahim on 3/24/24.
//

import SwiftUI
extension Color {
  static let colors: [Color] = [
    .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
  ]
    static func random() -> Color{
        colors.randomElement() ?? .black
    }
}
