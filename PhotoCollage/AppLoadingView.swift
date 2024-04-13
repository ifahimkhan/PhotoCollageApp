//
//  AppLoadingView.swift
//  PhotoCollage
//
//  Created by Fahim on 4/13/24.
//

import SwiftUI

struct AppLoadingView: View {
    @State private var showSplash:Bool = true
    var body: some View {
        if showSplash{
            SplashScreen().ignoresSafeArea().onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
                    withAnimation{
                        showSplash = false
                    }
                }
            }
            
        }else{
            CardsListView()
                .transition(.slide)
                //.transition(.asymmetric(insertion: .slide, removal:.scale))
                //.transition(.scale(scale: 0, anchor: .top))
        }
    }
}

struct AppLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AppLoadingView()
            .environmentObject(CardStore(defaultData: true))
    }
}
