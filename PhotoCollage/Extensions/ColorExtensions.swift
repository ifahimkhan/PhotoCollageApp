//
//  ColorExtensions.swift
//  PhotoCollage
//
//  Created by Fahim on 3/24/24.
//

import SwiftUI
extension Color {
  static let randomColors: [Color] = [
    Color("random1"),
    Color("random2"),
    Color("random3"),
    Color("random4"),
    Color("random5"),
    Color("random6"),
    Color("random7"),
    Color("random8")
  ]

  static func random() -> Color {
    randomColors.randomElement() ?? .black
  }
}

extension Color {
  func colorComponents() -> [CGFloat] {
    let uiColor = UIColor(self)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    uiColor.getRed(
      &red,
      green: &green,
      blue: &blue,
      alpha: &alpha)
    return [red, green, blue, alpha]
  }

  static func color(components color: [CGFloat]) -> Color {
    let uiColor = UIColor(
      red: color[0],
      green: color[1],
      blue: color[2],
      alpha: color[3])
    return Color(uiColor)
  }
}

