//
//  Taste.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Taste: View {
    @ObservedObject var spotifyController: SpotifyController
    
    @State var selectedTaste = [Artist]()
    @Binding var onboarded : Bool
    @StateObject var screen = Screen()

    var body: some View {
        VStack {
            HStack {
                Text("Define your taste")
                    .font(.custom("CircularStd-Medium", size: 18))
                Spacer()
                Text("2/3")
                    .font(.custom("CircularStd-Medium", size: 18))
            }.padding(.horizontal)
            .padding(.top)
            
            ZStack {
                Rectangle()
                    .frame(height: screen.height / 101.5)
                HStack {
                    Spacer()
                    Rectangle()
                        .fill(Color(hex: "FFF"))
                        .frame(width: screen.width / 3.26, height: screen.height / 101.5)
                }
            }.padding()
            
            HStack {
                Text("Genre")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.horizontal)
            .padding(.top, screen.height / 162.4)
            
            GenreSelector()
                .padding(.horizontal)
                .padding(.bottom)
            
            FavoriteArtist(spotifyController: spotifyController, selectedTaste: $selectedTaste)
            
            Spacer()
        }
        .background((Color(hex:"FFCC54")).ignoresSafeArea())
        .opacity(selectedTaste.count >= 3 ? 0 : 1)
        if (selectedTaste.count >= 3) {
        PeopleToFollow(spotifyController: spotifyController, onboarded: $onboarded)
            .offset(x: selectedTaste.count >= 3 ? 0 : -screen.width )
            .animation(.easeIn)
        }
    }
}

//struct Taste_Previews: PreviewProvider {
//    static var previews: some View {
//        Taste()
//    }
//}
