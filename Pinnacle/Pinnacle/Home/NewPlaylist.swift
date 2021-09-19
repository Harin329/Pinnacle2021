//
//  NewPlaylist.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct NewPlaylist: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image("creator1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                Text(" Sophia Choi")
                    .font(.custom("CircularStd-Medium", size: 13))
                Text(" created a")
                    .font(.custom("CircularStd-Book", size: 13))
                Text(" new playlist")
                    .font(.custom("CircularStd-Book", size: 13))
                    .background(Rectangle()
                                    .foregroundColor(Color(hex: "FFCC54").opacity(0.54))
                                    .frame(height: 10))
                Spacer()
                Text("Sep 17 ")
                    .font(.custom("CircularStd-Book", size: 13))
                    .foregroundColor(Color(hex: "777"))
            }
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color(hex: "FA7549"))
                        .frame(width: 150, height: 150)
                    Image(systemName: "play.fill")
                        .foregroundColor(Color(hex:"fff"))
                        .font(.system(size: 35))
                }
                VStack {
                    HStack {
                        Text("Korean Bops")
                            .font(.custom("CircularStd-Medium", size: 18))
                        Spacer()
                    }
                    HStack {
                        Text("17 songs · 1h 05min")
                            .font(.custom("CircularStd-Medium", size: 14))
                        Spacer()
                    }
                }
            }
        }.padding()
    }
}

struct NewPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaylist()
    }
}
