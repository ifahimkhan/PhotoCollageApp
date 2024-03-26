//
//  TextExtensions.swift
//  PhotoCollage
//
//  Created by Fahim on 3/26/24.
//



import SwiftUI

extension Text {
  func scalableText(font: Font = Font.system(size: 1000)) -> some View {
    self
      .font(font)
      .minimumScaleFactor(0.01)
      .lineLimit(1)
  }
}
