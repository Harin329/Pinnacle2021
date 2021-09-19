//
//  Rising.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct Rising: View {
    @State var playlists = [Playlist]()
    
    var body: some View {
        VStack {
            HStack {
                Text("Rising Playlists")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
                Text("See more")
                    .font(.custom("CircularStd-Medium", size: 13))
                    .foregroundColor(Color(hex: "6360FF"))

            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 0){
                    ForEach(playlists, id: \.self) {playlist in
                        RisingCard(playlist: playlist)
                    }
                }
            }
        }.padding(.horizontal)
    }
    
    func getRecommendedPlaylist(spotifyController: SpotifyController) {
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/recommendByAlgo?userID=" + spotifyController.user_id!)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! [AnyObject]
                        let a = converted_respose[0] as! [[Any]]
                        for item in a {
                            let p = Playlist(Name: item[1], ID: <#T##String#>, Image: <#T##String#>, Creator: <#T##String#>, Songs: <#T##[Song]#>)
                            playlists.append(p)
                        }
                    }
                }
                return
            }
        }
        .resume()
    }
}

struct RisingCard: View {
    @State var playlist : Playlist
    @State var liked = false
    var body: some View {
        VStack {
            ZStack {
                Button (action:{}) {
                    Image(playlist.Image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
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
                }.frame(width: 150, height: 150)
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

struct Rising_Previews: PreviewProvider {
    static var previews: some View {
        Rising().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
