//
//  Reshared.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct Reshared: View {
    var body: some View {
        VStack {
            HStack(spacing:0) {
                Image("creator1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                Text(" Jenny Cai")
                    .font(.custom("CircularStd-Medium", size: 14))
                Text(" reshared ")
                    .font(.custom("CircularStd-Book", size: 14))
                Image(systemName: "arrow.2.squarepath")
                    .foregroundColor(Color(hex: "000"))
                    .font(.system(size: 20))
                Spacer()
            }
            HStack {
                Image("playlist1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160)
                VStack (spacing: 8) {
                    HStack {
                        Text("Olivia O’Malley")
                            .font(.custom("CircularStd-Book", size: 13))
                            .foregroundColor(Color(hex:"6360FF"))
                        Spacer()
                    }
                    HStack {
                        Text("songs to sing at the top of your lungs in the car")
                            .font(.custom("CircularStd-Medium", size: 16))
                        Spacer()
                    }
                    HStack {
                        Text("with the windows down driving late at night with your best friends")
                            .font(.custom("CircularStd-Book", size: 12))
                        Spacer()
                    }
                    HStack {
                        Text("16,960 likes · 7h 26 m")
                            .font(.custom("CircularStd-Book", size: 13))
                            .foregroundColor(Color(hex: "777"))
                        Spacer()
                    }
                }
            }
        }.padding()
        .padding(.bottom)
        .background((Color(hex:"BEE47F")))
    }
}

struct Reshared_Previews: PreviewProvider {
    static var previews: some View {
        Reshared()
    }
}
