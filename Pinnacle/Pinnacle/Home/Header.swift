//
//  Header.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Button(action:{}) {
                Image(systemName: "camera")
                    .foregroundColor(Color(hex: "101010"))
                    .font(.system(size: 25))
            }.padding(.bottom, 25)
            Spacer()
            Text("Feed")
                .font(.custom("CircularStd-Medium", size: 22))
            Spacer()
            Button(action:{}) {
                Image("inbox")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
            }.padding(.bottom, 25)
        }.padding()
        .padding(.top, 30)
        .background((Color(hex:"FFCC54")))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
