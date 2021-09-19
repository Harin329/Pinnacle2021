//
//  Post.swift
//  Pinnacle
//
//  Created by Harin Wu on 2021-09-18.
//

import Foundation

struct Post: Codable, Hashable {
    var PostType: String
    var Creator: String
    var ID: String
    var Text: String
}
