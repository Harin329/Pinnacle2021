//
//  FavoriteArtist.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct FavoriteArtist: View {
    @ObservedObject var spotifyController: SpotifyController
    @State var topArtists: [Artist] = []
    @State var loadedData2: Bool = false
    @Binding var selectedTaste: [Artist]
    
    var body: some View {
        if loadedData2 {
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
                    ArtistCircle(artist: topArtists[0], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[1], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[2], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[3], selectedTaste: $selectedTaste)
                }
                HStack {
                    ArtistCircle(artist: topArtists[4], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[5], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[6], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[7], selectedTaste: $selectedTaste)
                }
                HStack {
                    ArtistCircle(artist: topArtists[8], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[9], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[10], selectedTaste: $selectedTaste)
                    Spacer()
                    ArtistCircle(artist: topArtists[11], selectedTaste: $selectedTaste)
                }
            }.padding()
            .background((Color(hex:"fff")).ignoresSafeArea())
        } else {
            VStack {}
                .onAppear(perform: {
                    while true {
                        if spotifyController.accessToken != nil {
                            getTopArtists(spotifyController: spotifyController)
                            break
                        } else {
                            sleep(1)
                        }
                    }
                })
        }
        
    }
    
    func getTopArtists(spotifyController: SpotifyController) {
        let parameters = "{\n    \"UserID\": \"" + self.spotifyController.user_id! + "\",\n    \"UserName\": \"" + self.spotifyController.display_name! + "\",\n    \"Token\": \"" + self.spotifyController.accessToken! + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/getTopArtists")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! [AnyObject]
                        let a = converted_respose[0]["items"] as! [AnyObject]
                        for item in a {
                            
                            //                            print(item["name"])
                            //                            print(item["id"])
                            let a = item["images"] as! [AnyObject]
                            //                            print(d[0]["url"])
                            let s = Artist(Name: item["name"] as! String, ID: item["id"] as! String, Image: a[0]["url"] as! String)
                            topArtists.append(s)
                            print(topArtists)
                        }
                        loadedData2 = true
                    }
                }
                return
            }
        }
        .resume()
    }
}


struct ArtistCircle: View {
    @State var artist: Artist
    @Binding var selectedTaste: [Artist]
    
    @StateObject var screen = Screen()
    @State var selected = false
    
    var body: some View {
        VStack {
            Button(action: {
                selected.toggle()
                selectedTaste.append(artist)
            }) {
                ZStack {
                    URLImageView(urlString: artist.Image)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.width / 5.769, height: screen.height / 12.492)
                    if selected {
                        Circle()
                            .foregroundColor(Color(hex:"101010"))
                            .opacity(0.3)
                            .frame(width: screen.width / 5.769, height: screen.height / 12.492)
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(hex: "fff"))
                            .font(.title)
                    }
                }
            }
            Text(artist.Name)
                .font(.custom("CircularStd-Medium", size: 12))
        }.frame(width: screen.width / 4.688, height: screen.height / 10.15)
    }
}

struct SearchBar: View {
    @State var searchText: String
    
    @StateObject var screen = Screen()

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
        .frame(height: screen.height / 20.3)
        .cornerRadius(13)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hex: "#FFCC54"), lineWidth: 2))
    }
}

//struct FavoriteArtist_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteArtist()
//    }
//}
