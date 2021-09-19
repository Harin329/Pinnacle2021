//
//  Home.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
        
            ScrollView {
                VStack {
                    Header()
                    HomeSearchBar(searchText: "")
                        .padding()
                    Following()
                    Rising()
                    CreatorMonth()
                    NewPlaylist()
                    PlusFour()
                    Spacer()
                }
            }.ignoresSafeArea()
        }.background((Color(hex:"fff")).ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
