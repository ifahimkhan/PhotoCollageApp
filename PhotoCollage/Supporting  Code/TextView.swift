import SwiftUI

struct TextView: View {
  @Binding var font: String
  @Binding var color: Color

  var body: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          fonts
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
      }
      HStack {
        colors
      }
    }
    .frame(maxWidth: .infinity)
    .padding([.top, .bottom])
    .background(Color.primary)
  }

  var fonts: some View {
    ForEach(0..<AppFonts.fonts.count, id: \.self) { index in
      ZStack {
        Circle()
          .foregroundColor(.primary)
          .colorInvert()
        Text("Aa")
          .font(.custom(AppFonts.fonts[index], size: 20))
          .fontWeight(.heavy)
          .foregroundColor(.primary)
      }
      .frame(
        width: AppFonts.fonts[index] == font ? 50 : 40,
        height: AppFonts.fonts[index] == font ? 50 : 40)
      .onTapGesture {
        withAnimation {
          font = AppFonts.fonts[index]
        }
      }
    }
  }

  var colors: some View {
    ForEach(1..<8) { index in
      let currentColor = Color("appColor\(index)")
      ZStack {
        Circle()
          .stroke(Color.white, lineWidth: 1.0)
          .overlay(
            Circle()
              .foregroundColor(color == currentColor ? currentColor : .white))
          .frame(
            width: 44,
            height: 44)
        Circle()
          .stroke(lineWidth: color == currentColor ? 0 : 1)
          .overlay(
            Circle()
              .foregroundColor(currentColor))
          .frame(
            width: color == currentColor ? 50 : 40,
            height: color == currentColor ? 50 : 40)
      }
      .onTapGesture {
        withAnimation {
          color = Color("appColor\(index)")
        }
      }
    }
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    TextView(
      font: .constant("San Fransisco"),
      color: .constant(Color("appColor2")))
  }
}
