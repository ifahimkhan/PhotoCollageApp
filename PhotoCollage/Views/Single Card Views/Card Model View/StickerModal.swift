//
//  StickerModal.swift
//  PhotoCollage
//
//  Created by Ragesh on 3/28/24.
//

import SwiftUI

struct StickerModal: View {
    var body: some View {
        if let resourcePath = Bundle.main.resourcePath,
           let image = UIImage(named: resourcePath+"/Stickers/Camping/fire.png"){
            Image(uiImage: image)
        }else{
            EmptyView()
        }
    }
    
}

struct StickerModal_Previews: PreviewProvider {
    static var previews: some View {
        StickerModal()
    }
}
