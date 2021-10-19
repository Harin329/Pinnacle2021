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
    @Binding var selected : Bool
    @StateObject var screen = Screen()

    var body: some View {
        if loadedData {
            HStack {
                VStack {
                    Button(action:{
                        withAnimation(.easeIn(duration: 1)){
                            selected = true
                        }
                    }) {
                        URLImageView(urlString: topSongs[0].Image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 3.409 , height: screen.height / 7.382)
                    }
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
                    
                }.frame(width: screen.width / 3.409, height: screen.height / 2.707, alignment: .top)
                Spacer()
                VStack {
                    Button(action:{
                        withAnimation(.easeIn(duration: 1)){
                            selected = true
                        }
                    }) {
                        URLImageView(urlString: topSongs[1].Image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 3.409, height: screen.height / 7.382)
                    }
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
                }.frame(width: screen.width / 3.409, height: screen.height / 2.707, alignment: .top)
                Spacer()
                VStack {
                     Button(action:{
                        withAnimation(.easeIn(duration: 1)){
                            selected = true
                        }
                    }) {
                        URLImageView(urlString: topSongs[2].Image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 3.409, height: screen.height / 7.382)
                    }
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
                }.frame(width: screen.width / 3.409, height: screen.height / 2.707, alignment: .top)
            }.padding().onAppear(perform: {
                logUser(spotifyController: spotifyController)
                logPlaylists(spotifyController: spotifyController)
            })
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
    
    func logUser(spotifyController: SpotifyController) {
        let parameters = "{\n    \"UserID\": \"" + self.spotifyController.user_id! + "\",\n    \"UserName\": \"" + self.spotifyController.display_name! + "\",\n    \"Token\": \"" + self.spotifyController.accessToken! + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/logUser")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print(response)
                }
                return
            }
        }
        .resume()
    }
    
    func logPlaylists(spotifyController: SpotifyController) {
        let parameters = "{\n    \"UserID\": \"" + self.spotifyController.user_id! + "\",\n    \"UserName\": \"" + self.spotifyController.display_name! + "\",\n    \"Token\": \"" + self.spotifyController.accessToken! + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/user/playlist")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print(response)
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
