//
//  Following.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Following: View {
    @ObservedObject var spotifyController: SpotifyController
    @State var playlists = [Playlist]()
    
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
        .onAppear(perform: {
            while true {
                if spotifyController.accessToken != nil {
                    getRecommendedUserPlaylist(spotifyController: spotifyController)
                    break
                } else {
                    sleep(1)
                }
            }
        })
    }
    
    func getRecommendedUserPlaylist(spotifyController: SpotifyController) {
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/recommendByUser?userID=" + spotifyController.user_id!)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! [AnyObject]
                        let a = converted_respose[0] as! [[Any]]
                        for item in a {
                            getPlaylistInfo(spotifyController: spotifyController, playlist: item)
                        }
                    }
                }
                return
            }
        }
        .resume()
    }
    
    func getPlaylistInfo(spotifyController: SpotifyController, playlist: [Any]) {
        print(playlist)
        let id = playlist[3] as! String
        guard let url = URL(string: "https://api.spotify.com/v1/playlists/" + id + "?fields=description%2C%20followers%2C%20href%2C%20id%2C%20images%2C%20name%2C%20owner%2C%20public") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer " + spotifyController.accessToken!, forHTTPHeaderField: "Authorization")
        let name = playlist[6] as! String
        var img = ""
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! Dictionary<String, Any>
                        print(converted_respose)
                        let a = converted_respose["images"] as! [AnyObject]
                        
                        let n = converted_respose["owner"] as AnyObject
                        let creator = n["display_name"] as! String
                        if (a.count > 0) {
                            img = a[0]["url"] as? String ?? ""
                        }
                        print(img)
                        
                        let p = Playlist(Name: name, ID: id, Image: img, Creator: creator, Songs: [])
                        playlists.append(p)
                    }
                    
                }
                
                return
            }
        }
        .resume()
    }
}

struct FollowingCard: View {
    @State var playlist : Playlist
    @State var liked = false
    var body: some View {
        VStack {
            ZStack {
                Button (action:{}) {
                    URLImageView(urlString: playlist.Image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipped()
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

//struct Following_Previews: PreviewProvider {
//    static var previews: some View {
//        Following().previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
