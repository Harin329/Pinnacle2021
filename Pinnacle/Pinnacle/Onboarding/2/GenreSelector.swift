//
//  GenreSelector.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct GenreSelector: View {
    var body: some View {
        VStack {
            HStack {
                GenreCapsule(title: "Pop", width: 75)
                Spacer()
                GenreCapsule(title: "R&B", width: 75)
                Spacer()
                GenreCapsule(title: "Hip Hop", width: 85)
                Spacer()
                GenreCapsule(title: "K-Pop", width: 80)
            }
            HStack {
                GenreCapsule(title: "Dance / Electronic", width: 175)
                GenreCapsule(title: "Country", width: 100)
                Spacer()
            }
            HStack {
                GenreCapsule(title: "Indie", width: 75)
                Spacer()
                GenreCapsule(title: "Lo-Fi", width: 75)
                Spacer()
                GenreCapsule(title: "Rock", width: 75)
                Spacer()
                GenreCapsule(title: "Classical", width: 85)
            }
        }
    }
}

struct GenreCapsule: View {
    var title : String
    var width : CGFloat
    @State var selected = false
    var body: some View {
        Button(action: {
            selected.toggle()
        }) {
            HStack {
                Text(title)
                    .font(.custom("CircularStd-Book", size: 16))
                    .foregroundColor(Color(hex: "#101010"))
                    .padding([.vertical],8)
                    .frame(width:width)
            }.background(selected ? Color(hex: "#fff") : nil)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2))
        }
    }
}

struct GenreSelector_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelector()
    }
}
