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
    @StateObject var screen = Screen()

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
                        NewPlaylistFollow().offset(y:screen.height / 101.5)
                        Reshared().offset(y:screen.height / 50.75)
                        NewSong().offset(y:screen.height / 50.75)
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
