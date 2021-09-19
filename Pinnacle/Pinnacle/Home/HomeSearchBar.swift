//
//  HomeSearchBar.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct HomeSearchBar: View {
    @State var searchText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "FFCC54"))
            HStack {
                TextField("", text: $searchText)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "101010"))
                    .padding()
            }
            .foregroundColor(.gray)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hex: "#FFCC54"), lineWidth: 2))
    }
}

struct HomeSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchBar(searchText: "")
    }
}
