//
//  Following.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Following: View {
    var body: some View {
        VStack {
            HStack {
                Text("Following")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
                Text("See more")
                    .font(.custom("CircularStd-Medium", size: 13))
                    .foregroundColor(Color(hex: "6360FF"))

            }
            ScrollView(.horizontal) {
                
            }
        }.padding()
    }
}

struct FollowingCard: View {
    
    var body: some View {
        VStack {
            Image("")
        }.padding()
    }
}

struct Following_Previews: PreviewProvider {
    static var previews: some View {
        Following().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
