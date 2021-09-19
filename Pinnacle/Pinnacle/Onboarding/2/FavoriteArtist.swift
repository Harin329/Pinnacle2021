//
//  FavoriteArtist.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct FavoriteArtist: View {
    var body: some View {
        VStack {
            HStack {
                Text("Favourite artists (Choose 3)")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.vertical)
            SearchBar(searchText: "")
            HStack {
                Text("Artists you listen to on Spotify:")
                    .font(.custom("CircularStd-Medium", size: 16))
                Spacer()
            }
            .padding(.top)
            HStack {
                ArtistCircle()
                Spacer()
                ArtistCircle()
                Spacer()
                ArtistCircle()
                Spacer()
                ArtistCircle()
            }
            HStack {
                ArtistCircle()
                Spacer()
                ArtistCircle()
                Spacer()
                ArtistCircle()
                Spacer()
                ArtistCircle()
            }
            HStack {
                ArtistCircle()
                Spacer()
                ArtistCircle()
                Spacer()
                ArtistCircle()
                Spacer()
                ArtistCircle()
            }
        }.padding()
        .background((Color(hex:"fff")).ignoresSafeArea())
        .onAppear(perform: {
//            let payload = apiPayload(UserID: spotifyController.user_id!, UserName: spotifyController.display_name!, token: spotifyController.accessToken!)
//            let artists = SongEndpoints.getTop12(payload: payload)
//            print(artists)
        })
    }
}

struct ArtistCircle: View {
    var image : String = "https://media-exp1.licdn.com/dms/image/C5603AQER37hJyH_-Nw/profile-displayphoto-shrink_800_800/0/1547516998888?e=1637193600&v=beta&t=_f4NExij6aZg5gbWSUcICbMMbhhc0FvfBhOJMNJHLX8"
    var name : String = "Harin Wu"
    @State var selected = false
    var body: some View {
        VStack {
            Button(action: {
                selected.toggle()
            }) {
                ZStack {
                    URLImageView(urlString: image)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                    if selected {
                        Circle()
                            .foregroundColor(Color(hex:"101010"))
                            .opacity(0.3)
                            .frame(width: 65, height: 65)
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(hex: "fff"))
                            .font(.title)
                    }
                }
            }
            Text(name)
                .font(.custom("CircularStd-Medium", size: 12))
        }
    }
}

struct SearchBar: View {
    @State var searchText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "fff"))
            HStack {
                TextField("", text: $searchText)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "101010"))
                    .padding()
            }
            .foregroundColor(.gray)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hex: "#FFCC54"), lineWidth: 2))
    }
}

struct FavoriteArtist_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteArtist()
    }
}
