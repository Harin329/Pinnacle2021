//
//  PinnacleApp.swift
//  Pinnacle
//
//  Created by Harin Wu on 2021-09-17.
//

import SwiftUI

@main
struct PinnacleApp: App {
    @StateObject var spotifyController = SpotifyController()
    @State var onboarded = false
    var body: some Scene {
        WindowGroup {
            VStack {
                if onboarded {
                    Home()
                } else {
                    CreateProfile(spotifyController: spotifyController, onboarded: $onboarded)
                        .onOpenURL { url in
                            spotifyController.setAccessToken(from: url)
                            spotifyController.getUserId()
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
                            spotifyController.connect()
                        })
                }
            }.statusBar(hidden: true)
        }
    }
}


//func getArticles(input_url: String, category: String, final: Bool) {
//    guard let url = URL(string: input_url) else { return }
//    
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if let data = data {
//            if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
//                DispatchQueue.main.async {
//                    var index = 0
//                    for i in response as! Array<Dictionary<String, Any>>{
//                        if index == 10 {
//                            index = 0
//                        }
//                        var images : [String] = []
//                        var body = ((i["content"] as! Dictionary<String, Any>)["rendered"] as! String)
//                        // get embedded image urls and append to array
//                        if let doc = try?Kanna.HTML(html: body, encoding: String.Encoding.utf8) {
//                            for link in doc.xpath("//img") {
//                                images.append(link["src"]!)
//                                }
//                        }
//                        //replace img tags with a holder which is used to parse the string
//                        body = body.replacingOccurrences(of: "<img[^>]*\\>", with: "t3mp0raryH0ld3r", options: .regularExpression)
//                        let body_parsed = body.components(separatedBy: "t3mp0raryH0ld3r")
//                        var bodies : [Story_Body] = []
//                        var body_count = 0
//                        var image_count = 0
//                        while body_count < body_parsed.count || image_count < images.count {
//                            // alternate adding a Story_Body with text then image...
//                            if body_count == image_count {
//                                let temp = body_parsed[body_count]
//                                bodies.append(Story_Body(id: body_count, text: temp, image: ""))
//                                body_count += 1
//                            }
//                            else {
//                                bodies.append(Story_Body(id: body_count, text: "", image: images[image_count]))
//                                image_count += 1
//                            }
//                        }
//                        let title = (i["title"] as! Dictionary<String, String>)["rendered"]!
//                        
//                        index += 1
//                    }
//                }
//                progressValue += 0.15
//                return
//            }
//        }
//    }
//    .resume()
//}
