//
//  OnboardingSonf.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct OnboardingSong: View {
    @ObservedObject var spotifyController: SpotifyController
    
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
            let payload = apiPayload(UserID: spotifyController.user_id!, UserName: spotifyController.display_name!, token: spotifyController.accessToken!)
            let songs = SongEndpoints.getTop3(payload: payload)
            print(songs)
            print(spotifyController.accessToken as Any)
        })
    }
}

//struct OnboardingSong_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingSong().previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
