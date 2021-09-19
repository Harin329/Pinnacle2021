//
//  CreatorMonth.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct CreatorMonth: View {
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
                    .frame(width: 75)
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
                    }.padding(.top,5)
                    HStack(spacing: 0){
                        Text("2.2k")
                            .font(.custom("CircularStd-Medium", size: 20))
                            .foregroundColor(Color(hex:"6360FF"))
                        Text(" saves on playlists")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }
                    HStack {
                        CreatorCapsule(title: "Country", width: 90)
                        CreatorCapsule(title: "Pop", width: 70)
                        CreatorCapsule(title: "Jazz", width: 80)
                        Spacer()
                    }
                }
            }.padding(.bottom, 15)
            HStack {
                Image("emilyliu")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 75)
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
                    }.padding(.top,5)
                    HStack(spacing: 0){
                        Text("2.2k")
                            .font(.custom("CircularStd-Medium", size: 20))
                            .foregroundColor(Color(hex:"6360FF"))
                        Text(" saves on playlists")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }
                    HStack {
                        CreatorCapsule(title: "R&B", width: 70)
                        CreatorCapsule(title: "K-Pop", width: 80)
                        CreatorCapsule(title: "Hip Hop", width: 90)
                        Spacer()
                    }
                }
            }
        }
        .padding(.top, 10)
        .padding()
        .background((Color(hex:"FFCC54")))
        
    }
}

struct CreatorCapsule: View {
    var title : String
    var width : CGFloat
    @State var selected = false
    var body: some View {
        Button(action: {
            selected.toggle()
        }) {
            HStack {
                Text(title)
                    .font(.custom("CircularStd-Book", size: 14))
                    .foregroundColor(Color(hex: "#101010"))
                    .padding([.vertical],5)
                    .frame(width:width)
            }.background(Color(hex: "#fff"))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2))
        }
    }
}


struct CreatorMonth_Previews: PreviewProvider {
    static var previews: some View {
        CreatorMonth()
    }
}
