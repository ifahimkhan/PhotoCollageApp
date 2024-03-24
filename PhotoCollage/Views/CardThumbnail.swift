//
//  CardThumbnail.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//

import SwiftUI

struct CardThumbnail: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(Color.random())
            .frame(width: Settings.thumbnailSize.width,height: Settings.thumbnailSize.height)
    }
}

struct CardThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnail()
    }
}
