//
//  CreateProfile.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct CreateProfile: View {
    var body: some View {
        VStack {
            HStack {
                Text("Create profile")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
                Text("1/3")
                    .font(.custom("CircularStd-Medium", size: 22))
            }.padding(.horizontal, 15)
            
            HStack {
                Text("Sync with Spotify")
                    .font(.custom("CircularStd-Medium", size: 28))
                Spacer()
            }
            Spacer()

        }.background((Color(hex:"39D9B1")).ignoresSafeArea())
    }
}

struct CreateProfile_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile()
    }
}
