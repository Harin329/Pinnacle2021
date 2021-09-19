//
//  Payload.swift
//  Pinnacle
//
//  Created by Harin Wu on 2021-09-18.
//

import Foundation

struct apiPayload: Codable, Hashable {
    var UserID: String
    var UserName: String
    var token: String
}
