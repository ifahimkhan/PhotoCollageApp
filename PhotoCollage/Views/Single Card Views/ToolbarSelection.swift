//
//  ToolbarSelection.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//

import Foundation

enum ToolbarSelection: CaseIterable,Identifiable{
    var id: Int{
        hashValue
    }
   case photoModal,frameModal,stickerModal,textModal
}
