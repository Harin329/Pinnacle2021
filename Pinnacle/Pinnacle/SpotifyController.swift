//
//  SpotifyController.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-17.
//

import SwiftUI
import Combine


class SpotifyController: NSObject, ObservableObject {
    let spotifyClientID = "8c3b694f5a8a4d12af6e1dd6f68b7502"
    let spotifyRedirectURL = URL(string:"spotify-ios-quick-start://spotify-login-callback")!
    
    @Published var accessToken: String? = nil
    var user_id: String? = nil
    var display_name: String? = nil
    
    var playURI = ""
    
    private var connectCancellable: AnyCancellable?
    
    private var disconnectCancellable: AnyCancellable?
    
    override init() {
        super.init()
        connectCancellable = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            }
        
        disconnectCancellable = NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            }
        
    }
    
    
    lazy var configuration = SPTConfiguration(
        clientID: spotifyClientID,
        redirectURL: spotifyRedirectURL
    )
    
    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.connectionParameters.accessToken = self.accessToken
        appRemote.delegate = self
        return appRemote
    }()
    
    func setAccessToken(from url: URL) {
        print(url)
        let parameters = appRemote.authorizationParameters(from: url)
        if let accessToken = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = accessToken
            self.accessToken = accessToken
            self.getUserId()
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(errorDescription)
        }
        
    }
    
    //    func pause() {
    //        guard let url = URL(string: "https://api.spotify.com/v1/me/player/pause") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.addValue("application/json", forHTTPHeaderField: "Accept")
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        request.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
    //        print(request.allHTTPHeaderFields)
    //        URLSession.shared.dataTask(with: request) { (data, response, error) in
    //            if let data = data {
    //                    return
    //                }
    //        }
    //        .resume()
    //    }
    
    func getUserId() {
        guard let url = URL(string: "https://api.spotify.com/v1/me") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! Dictionary<String, Any>
                        self.user_id = (converted_respose["id"] as! String)
                        self.display_name = (converted_respose["display_name"] as! String)
                    }
                }
                return
            }
        }
        .resume()
    }
    
    func connect() {
        guard let _ = self.appRemote.connectionParameters.accessToken else {
            self.appRemote.authorizeAndPlayURI("", asRadio: true, additionalScopes: ["user-modify-playback-state","user-read-playback-position", "user-library-read", "user-top-read", "playlist-modify-public","playlist-read","user-follow-read","user-read-playback-state","user-read-recently-played","playlist-read-collaborative","user-follow-modify","user-read-currently-playing"])
            return
        }
        appRemote.connect()
    }
    
    func disconnect() {
        if appRemote.isConnected {
            appRemote.disconnect()
        }
    }
}

extension SpotifyController: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        self.appRemote = appRemote
        self.appRemote.playerAPI?.delegate = self
        self.appRemote.playerAPI?.subscribe(toPlayerState: { (result, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
            
        })
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("failed")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("disconnected")
    }
}

extension SpotifyController: SPTAppRemotePlayerStateDelegate {
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        debugPrint("Track name: %@", playerState.track.name)
    }
    
}
