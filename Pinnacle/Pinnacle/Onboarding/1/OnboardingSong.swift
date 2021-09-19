//
//  OnboardingSonf.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct OnboardingSong: View {
    @ObservedObject var spotifyController: SpotifyController
    @State var topSongs: [Song] = []
    @State var loadedData: Bool = false
    //    private let songs: [Song]
    
    //    init() {
    //        let payload = apiPayload(UserID: spotifyController.user_id!, UserName: spotifyController.display_name!, token: spotifyController.accessToken!)
    //        self.songs = SongEndpoints.getTop3(payload: payload)
    //        print(self.songs)
    //    }
    
    var body: some View {
        if loadedData {
            HStack {
                VStack {
                    URLImageView(urlString: topSongs[0].Image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                    HStack {
                        Text(topSongs[0].Name)
                            .font(.custom("CircularStd-Medium", size: 14))
                        Spacer()
                    }
                    HStack {
                        Text(topSongs[0].Artist)
                            .font(.custom("CircularStd-Medium", size: 12))
                            .foregroundColor(Color(hex: "fff"))
                        Spacer()
                    }
                    
                }.frame(width: 110, height: 300, alignment: .top)
                Spacer()
                VStack {
                    URLImageView(urlString: topSongs[1].Image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                    HStack {
                        Text(topSongs[1].Name)
                            .font(.custom("CircularStd-Medium", size: 14))
                        Spacer()
                    }
                    HStack {
                        Text(topSongs[1].Artist)
                            .font(.custom("CircularStd-Medium", size: 12))
                            .foregroundColor(Color(hex: "fff"))
                        Spacer()
                    }
                }.frame(width: 110, height: 300, alignment: .top)
                Spacer()
                VStack {
                    URLImageView(urlString: topSongs[2].Image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                    HStack {
                        Text(topSongs[2].Name)
                            .font(.custom("CircularStd-Medium", size: 14))
                        Spacer()
                    }
                    HStack {
                        Text(topSongs[2].Artist)
                            .font(.custom("CircularStd-Medium", size: 12))
                            .foregroundColor(Color(hex: "fff"))
                        Spacer()
                    }
                }.frame(width: 110, height: 300, alignment: .top)
            }.padding()
        } else {
            VStack {}
                .onAppear(perform: {
                    while true {
                        if spotifyController.accessToken != nil {
                            getTopSongs(spotifyController: spotifyController)
                            break
                        } else {
                            sleep(1)
                        }
                    }
                })
        }
    }
    
    func getTopSongs(spotifyController: SpotifyController) {
        let parameters = "{\n    \"UserID\": \"" + self.spotifyController.user_id! + "\",\n    \"UserName\": \"" + self.spotifyController.display_name! + "\",\n    \"Token\": \"" + self.spotifyController.accessToken! + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/getTop")!,timeoutInterval: Double.infinity)
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
                            let b = item["artists"] as! [AnyObject]
                            //                            print(b[0]["name"])
                            let c = item["album"] as AnyObject
                            let d = c["images"] as! [AnyObject]
                            //                            print(d[0]["url"])
                            let s = Song(Name: item["name"] as! String, ID: item["id"] as! String, Artist: b[0]["name"] as! String, Image: d[0]["url"] as! String)
                            topSongs.append(s)
                        }
                        loadedData = true
                    }
                }
                return
            }
        }
        .resume()
    }
}

//struct OnboardingSong_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingSong().previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
