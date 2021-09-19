//
//  Home.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Home: View {
    @State var menuSelection = 0
    var body: some View {
        ZStack {
            VStack (spacing:0) {
                Header()
                ScrollView {
                    VStack {
                        HomeSearchBar(searchText: "")
                            .padding()
                        Following()
                        Rising()
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
            VStack {
                Spacer()
                MenuBar(menuSelection: $menuSelection)
            }
        }.ignoresSafeArea()
        .animation(.easeIn)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
