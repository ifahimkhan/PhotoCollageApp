//
//  CardListView.swift
//  PhotoCollage
//
//  Created by Fahim on 3/20/24.
//
import SwiftUI

struct CardListView: View {
    @State private var isPresented = false
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<10){_ in
                    CardThumbnail().onTapGesture {
                        isPresented = true
                    }
                }
            }
        }.fullScreenCover(isPresented: $isPresented){
            SingleCardView()
        }.scrollIndicators(.hidden)
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}


