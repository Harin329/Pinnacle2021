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
//    private let songs: [Song]
        
//    init() {
//        let payload = apiPayload(UserID: spotifyController.user_id!, UserName: spotifyController.display_name!, token: spotifyController.accessToken!)
//        self.songs = SongEndpoints.getTop3(payload: payload)
//        print(self.songs)
//    }
    
    var body: some View {
        HStack {
            VStack {
                Rectangle()
                    .fill(Color(hex: "fff"))
                    .frame(width: 110, height: 110, alignment: .center)
                HStack {
                    Text("Song title")
                        .font(.custom("CircularStd-Medium", size: 14))
                    Spacer()
                }
                HStack {
                    Text("Artist")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color(hex: "fff"))
                    Spacer()
                }
                
            }
            Spacer()
            VStack {
                Rectangle()
                    .fill(Color(hex: "fff"))
                    .frame(width: 110, height: 110, alignment: .center)
                HStack {
                    Text("Song title")
                        .font(.custom("CircularStd-Medium", size: 14))
                    Spacer()
                }
                HStack {
                    Text("Artist")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color(hex: "fff"))
                    Spacer()
                }
            }
            Spacer()
            VStack {
                Rectangle()
                    .fill(Color(hex: "fff"))
                    .frame(width: 110, height: 110, alignment: .center)
                HStack {
                    Text("Song title")
                        .font(.custom("CircularStd-Medium", size: 14))
                    Spacer()
                }
                HStack {
                    Text("Artist")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color(hex: "fff"))
                    Spacer()
                }
            }
        }.padding()
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
    
    func getTopSongs(spotifyController: SpotifyController) {
        guard let url = URL(string: "https://pinnacle.harinwu.com/getTop") else { return }
        var request = URLRequest(url: url)
        let body: [String: String] = ["UserID": self.spotifyController.user_id!, "UserName": self.spotifyController.display_name!, "token": self.spotifyController.accessToken!]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        request.httpMethod = "GET"
        request.httpBody = finalBody
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! Dictionary<String, Any>
                        print("HELLLO")
                        print(converted_respose)
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
