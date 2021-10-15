//
//  NewSong.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct NewSong: View {
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
                                    .foregroundColor(Color(hex: "54E0FF").opacity(0.54))
                                    .frame(height: screen.height / 81.2))
                Spacer()
                Text("Sep 17 ")
                    .font(.custom("CircularStd-Book", size: 13))
                    .foregroundColor(Color(hex: "777"))
            }
            HStack {
                Image("playlist1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width / 2.5)
                VStack {
                    HStack {
                        Text("Feel A Way")
                            .font(.custom("CircularStd-Medium", size: 18))
                        Spacer()
                    }
                    HStack {
                        Text("Kiana Lede")
                            .font(.custom("CircularStd-Medium", size: 14))
                            .foregroundColor(Color(hex: "777"))
                        Spacer()
                    }.padding(.bottom, screen.height / 162.4)
                    HStack {
                        Text("Can’t believe I just discovered this song by Kiana! Thought you guys would love it too :)")
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
        }.padding().padding(.bottom, screen.height / 16.24)
    }
}

struct NewSong_Previews: PreviewProvider {
    static var previews: some View {
        NewSong()
    }
}
