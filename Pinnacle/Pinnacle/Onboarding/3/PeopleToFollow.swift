//
//  PeopleToFollow.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct PeopleToFollow: View {
    var body: some View {
        VStack {
            HStack {
                Text("People to follow")
                    .font(.custom("CircularStd-Medium", size: 18))
                Spacer()
                Text("3/3")
                    .font(.custom("CircularStd-Medium", size: 18))
            }.padding(.horizontal)
            .padding(.top)
            Rectangle()
                .frame(height: 8)
                .padding()
            HStack {
                Text("Here are a few people that")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.horizontal)
            .padding(.top, 5)
            HStack {
                Text("have similar taste as you.")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.horizontal)
            Spacer()
            
            HStack {
                
            }
            
        }
        .background((Color(hex:"51D8DC")).ignoresSafeArea())
    }
}

struct PeopleToFollow_Previews: PreviewProvider {
    static var previews: some View {
        PeopleToFollow()
    }
}
