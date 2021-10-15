//
//  NewPlaylist.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct NewPlaylist: View {
    @StateObject var screen = Screen()

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image("sophiachoi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width / 9.375)
                Text(" Sophia Choi")
                    .font(.custom("CircularStd-Medium", size: 13))
                Text(" created a")
                    .font(.custom("CircularStd-Book", size: 13))
                Text(" new playlist")
                    .font(.custom("CircularStd-Book", size: 13))
                    .background(Rectangle()
                                    .foregroundColor(Color(hex: "FFCC54").opacity(0.54))
                                    .frame(height: screen.height / 81.2))
                Spacer()
                Text("Sep 17 ")
                    .font(.custom("CircularStd-Book", size: 13))
                    .foregroundColor(Color(hex: "777"))
            }
            HStack {
                ZStack {
                    Image("sophiaplaylist")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screen.width / 2.885, height: screen.width / 2.885)
                        .clipped()
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
                            .foregroundColor(Color(hex: "777"))
                        Spacer()
                    }.padding(.bottom, screen.height / 162.4)
                    HStack {
                        Text("If you’re looking for chill Korean vibes to study to, this playlist is for you!")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }
                }
            }
            Divider()
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(hex: "000"))
                    .font(.system(size: 25))
                Text("45")
                    .font(.custom("CircularStd-Medium", size: 18))
                Spacer()
                Image(systemName: "bubble.left")
                    .foregroundColor(Color(hex: "000"))
                    .font(.system(size: 25))
                Text("10")
                    .font(.custom("CircularStd-Medium", size: 18))
                Spacer()
                Image(systemName: "arrow.2.squarepath")
                    .foregroundColor(Color(hex: "000"))
                    .font(.system(size: 25))
                Text("7")
                    .font(.custom("CircularStd-Medium", size: 18))
            }.padding()
        }.padding()
    }
}

struct NewPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaylist()
    }
}
