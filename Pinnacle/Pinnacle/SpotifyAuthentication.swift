//
//  SpotifyAuthentication.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct SpotifyAuthentication: View {
    @StateObject var spotifyController = SpotifyController()
    var body: some View {
        VStack {
            VStack {
                Text("Authenticate")
            }
        }
        .onOpenURL { url in
            spotifyController.setAccessToken(from: url)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
            spotifyController.connect()
})
    }
}

struct SpotifyAuthentication_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyAuthentication()
    }
}
