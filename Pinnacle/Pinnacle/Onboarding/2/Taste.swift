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
                    .frame(height: 8)
                HStack {
                    Spacer()
                    Rectangle()
                        .fill(Color(hex: "FFF"))
                        .frame(width: 115, height: 8)
                }
            }.padding()
            
            HStack {
                Text("Genre")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.horizontal)
            .padding(.top, 5)
            
            GenreSelector()
                .padding(.horizontal)
                .padding(.bottom)
            
            FavoriteArtist(spotifyController: spotifyController, selectedTaste: $selectedTaste)
            
            Spacer()
        }
        .background((Color(hex:"FFCC54")).ignoresSafeArea())
        .opacity(selectedTaste.count >= 3 ? 0 : 1)
        PeopleToFollow(spotifyController: spotifyController)
            .offset(x: selectedTaste.count >= 3 ? 0 : -3000 )
            .animation(.easeIn)
    }
}

//struct Taste_Previews: PreviewProvider {
//    static var previews: some View {
//        Taste()
//    }
//}
