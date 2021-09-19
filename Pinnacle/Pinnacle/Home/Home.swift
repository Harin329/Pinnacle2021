//
//  Home.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Home: View {
    @ObservedObject var spotifyController: SpotifyController

    @State var menuSelection = 0
    var body: some View {
        ZStack {
            VStack (spacing:0) {
                Header()
                ScrollView {
                    VStack {
                        HomeSearchBar(searchText: "")
                            .padding()
                        Following(spotifyController: spotifyController)
                        Rising(spotifyController: spotifyController)
                        CreatorMonth()
                        NewPlaylist()
                        PlusFour()
                        NewPlaylistFollow().offset(y:-8)
                        Reshared().offset(y:-16)
                        NewSong().offset(y:-16)
                    }
                }.ignoresSafeArea()
            }.ignoresSafeArea().background((Color(hex:"fff")))
            Profile()
                .offset(x: (menuSelection == 2) ? 0 : UIScreen.main.bounds.width)
            Add(menu: $menuSelection)
                .offset(y: (menuSelection == 1) ? 0 : UIScreen.main.bounds.height)
            VStack {
                Spacer()
                MenuBar(menuSelection: $menuSelection)
            }
        }.ignoresSafeArea()
        .animation(.easeIn)
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home().previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
