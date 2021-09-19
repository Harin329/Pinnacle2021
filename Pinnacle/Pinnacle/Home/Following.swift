//
//  Following.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Following: View {
    @State var playlists = [
        Playlist(Name: "Twenty", ID: "0", Image: "playlist1", Creator: "Jenny Cai", Songs: []),
        Playlist(Name: "Twenty", ID: "1", Image: "playlist1", Creator: "Jenny Cai", Songs: []),
        Playlist(Name: "Twenty", ID: "2", Image: "playlist1", Creator: "Jenny Cai", Songs: []),
        Playlist(Name: "Twenty", ID: "3", Image: "playlist1", Creator: "Jenny Cai", Songs: [])
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Following")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
                Text("See more")
                    .font(.custom("CircularStd-Medium", size: 13))
                    .foregroundColor(Color(hex: "6360FF"))

            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 0){
                    ForEach(playlists, id: \.self) {playlist in
                        FollowingCard(playlist: playlist)
                    }
                }
            }
        }.padding(.horizontal)
    }
}

struct FollowingCard: View {
    @State var playlist : Playlist
    @State var liked = false
    var body: some View {
        VStack {
            ZStack {
                Button (action:{}) {
                    Image(playlist.Image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                }
                VStack {
                    HStack {
                        Spacer()
                        Button (action:{
                            liked.toggle()
                        }) {
                            Image(systemName: liked ? "heart.fill" : "heart")
                                .foregroundColor(Color(hex: "fff"))
                                .font(.system(size: 23))
                        }.padding(4)
                    }
                    Spacer()
                }.frame(width: 120, height: 120)
            }
            HStack {
                Text(playlist.Name)
                    .font(.custom("CircularStd-Book", size: 14))
                Spacer()
            }
            HStack {
                Text(playlist.Creator)
                    .font(.custom("CircularStd-Book", size: 14))
                    .foregroundColor(Color(hex: "777"))
                Spacer()
            }
        }.padding(.vertical)
        .padding(.trailing)
    }
}

struct Following_Previews: PreviewProvider {
    static var previews: some View {
        Following().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
