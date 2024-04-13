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
            SplashScreen().ignoresSafeArea()
            
        }else{
            CardsListView()
        }
    }
}

struct AppLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AppLoadingView()
            .environmentObject(CardStore(defaultData: true))
    }
}
