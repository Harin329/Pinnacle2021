//
//  Playlist.swift
//  Pinnacle
//
//  Created by Harin Wu on 2021-09-18.
//

import Foundation

struct Playlist: Codable, Hashable {
    var Name: String
    var ID: String
    var Image: String
    var Creator: String
    var Songs: [Song]
}
