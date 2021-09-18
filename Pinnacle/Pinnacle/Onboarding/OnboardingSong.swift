//
//  OnboardingSonf.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct OnboardingSong: View {
    var body: some View {
        HStack {
            VStack {
                Rectangle()
                    .fill(Color(hex: "fff"))
                    .frame(width: 110, height: 110, alignment: .center)
                HStack {
                    Text("Song title")
                        .font(.custom("CircularStd-Medium", size: 14))
                    Spacer()
                }
                HStack {
                    Text("Artist")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color(hex: "fff"))
                    Spacer()
                }
                
            }
            Spacer()
            VStack {
                Rectangle()
                    .fill(Color(hex: "fff"))
                    .frame(width: 110, height: 110, alignment: .center)
                HStack {
                    Text("Song title")
                        .font(.custom("CircularStd-Medium", size: 14))
                    Spacer()
                }
                HStack {
                    Text("Artist")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color(hex: "fff"))
                    Spacer()
                }
            }
            Spacer()
            VStack {
                Rectangle()
                    .fill(Color(hex: "fff"))
                    .frame(width: 110, height: 110, alignment: .center)
                HStack {
                    Text("Song title")
                        .font(.custom("CircularStd-Medium", size: 14))
                    Spacer()
                }
                HStack {
                    Text("Artist")
                        .font(.custom("CircularStd-Medium", size: 12))
                        .foregroundColor(Color(hex: "fff"))
                    Spacer()
                }
            }
        }.padding()
    }
}

struct OnboardingSong_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSong().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
