//
//  GlobalVariables.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-21.
//

import SwiftUI

class Screen: ObservableObject {
    @Published var width = UIScreen.main.bounds.width
    @Published var height = UIScreen.main.bounds.height
}
