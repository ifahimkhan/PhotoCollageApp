import SwiftUI

struct ShareCardView: View {
  let card: Card

  var body: some View {
    GeometryReader { proxy in
      content(size: proxy.size)
    }
  }

  func content(size: CGSize) -> some View {
    ZStack {
      card.backgroundColor
      elements(size: size)
    }
    .frame(
      width: Settings.calculateSize(size).width,
      height: Settings.calculateSize(size).height)
    .clipped()
  }

  func elements(size: CGSize) -> some View {
    let viewScale = Settings.calculateScale(size)
    return ForEach(card.elements, id: \.id) { element in
      CardElementView(element: element)
        .frame(
          width: element.transform.size.width,
          height: element.transform.size.height)
        .rotationEffect(element.transform.rotation)
        .scaleEffect(viewScale)
        .offset(element.transform.offset * viewScale)
    }
  }
}

struct ShareCardView_Previews: PreviewProvider {
  static var previews: some View {
    ShareCardView(card: initialCards[0])
  }
}
