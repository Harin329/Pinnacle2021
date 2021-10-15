//
//  CreatorMonth.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct CreatorMonth: View {
    @StateObject var screen = Screen()

    var body: some View {
        VStack {
            HStack {
                Text("Rising Creator of the Month")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }
            HStack {
                Image("creator1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width / 5)
                    .clipped()
                VStack {
                    HStack {
                        Text("@carmenly")
                            .font(.custom("CircularStd-Medium", size: 18))
                        Spacer()
                        Text("Follow")
                            .font(.custom("CircularStd-Medium", size: 16))
                            .foregroundColor(Color(hex:"6360FF"))
                            .padding(.trailing)
                    }
                    HStack(spacing: 0){
                        Text("10")
                            .font(.custom("CircularStd-Medium", size: 20))
                            .foregroundColor(Color(hex:"6360FF"))
                        Text(" playlists created this month")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }.padding(.top,screen.height / 162.4)
                    HStack(spacing: 0){
                        Text("2.2k")
                            .font(.custom("CircularStd-Medium", size: 20))
                            .foregroundColor(Color(hex:"6360FF"))
                        Text(" saves on playlists")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }
                    HStack {
                        //TODO:
                        // Need to make this sizing dynamic
                        CreatorCapsule(title: "Country", width: screen.width / 4.167)
                        CreatorCapsule(title: "Pop", width: screen.width / 5.357)
                        CreatorCapsule(title: "Jazz", width: screen.width / 4.688)
                        Spacer()
                    }
                }
            }.padding(.bottom, screen.height / 54.133)
            HStack {
                Image("emilyliu")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screen.width / 5, height: screen.width / 5)
                    .clipped()
                VStack {
                    HStack {
                        Text("@emilyliu")
                            .font(.custom("CircularStd-Medium", size: 18))
                        Spacer()
                        Text("Follow")
                            .font(.custom("CircularStd-Medium", size: 16))
                            .foregroundColor(Color(hex:"6360FF"))
                            .padding(.trailing)
                    }
                    HStack(spacing: 0){
                        Text("10")
                            .font(.custom("CircularStd-Medium", size: 20))
                            .foregroundColor(Color(hex:"6360FF"))
                        Text(" playlists created this month")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }.padding(.top, screen.height / 162.4)
                    HStack(spacing: 0){
                        Text("2.2k")
                            .font(.custom("CircularStd-Medium", size: 20))
                            .foregroundColor(Color(hex:"6360FF"))
                        Text(" saves on playlists")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }
                    HStack {
                        CreatorCapsule(title: "R&B", width: screen.width / 5.357)
                        CreatorCapsule(title: "K-Pop", width: screen.width / 4.688)
                        CreatorCapsule(title: "Hip Hop", width: screen.width / 4.167)
                        Spacer()
                    }
                }
            }
        }
        .padding(.top, screen.height / 81.2)
        .padding()
        .background((Color(hex:"FFCC54")))
        
    }
}

struct CreatorCapsule: View {
    var title : String
    var width : CGFloat
    @State var selected = false
    @StateObject var screen = Screen()

    var body: some View {
        Button(action: {
            selected.toggle()
        }) {
            HStack {
                Text(title)
                    .font(.custom("CircularStd-Book", size: 14))
                    .foregroundColor(Color(hex: "#101010"))
                    .padding([.vertical],screen.height / 162.4)
                    .frame(width:width)
            }.background(Color(hex: "#fff"))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: screen.width / 187.5))
        }
    }
}


struct CreatorMonth_Previews: PreviewProvider {
    static var previews: some View {
        CreatorMonth()
    }
}
