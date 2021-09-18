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

    var body: some Scene {
        WindowGroup {
            VStack {
//                ContentView()
//                Button (action: {
//                    spotifyController.connect()
//                }) {
//                    Text("Login")
//                }
//                    .onOpenURL { url in
//                        spotifyController.setAccessToken(from: url)
//                    }
//                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
//                        spotifyController.connect()
//                })
                CreateProfile()
            }
        }
    }
}
