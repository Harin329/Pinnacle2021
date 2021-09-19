//
//  Profile.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct Profile: View {
    @State var follow = false
    var body: some View {
        VStack {
            VStack {
                Image("creator1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 230)
                    .padding(.top, 60)
                Text("Victor Uemura")
                    .font(.custom("CircularStd-Medium", size: 28))
                Text("@victor.ysu")
                    .font(.custom("CircularStd-Medium", size: 18))
                HStack (spacing: 0){
                    Text("Good Game · Dominic Fike ")
                        .font(.custom("CircularStd-Book", size: 16))
                        .foregroundColor(Color(hex:"0D8387"))
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                }
                Button(action: {
                    follow.toggle()
                }) {
                    HStack {
                        Text(follow ? "Following" : "Follow")
                            .font(.custom("CircularStd-Book", size: 16))
                            .foregroundColor(Color(hex: follow ? "#fff" : "#101010"))
                            .padding([.vertical],8)
                            .frame(width:100)
                    }.background(Color(hex: follow ? "#248487" : "#fff"))
                    .cornerRadius(30)
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background((Color(hex:"51D8DC")))
            VStack{
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:220)
                    .padding(.top, 30)
                Image("qr")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:220)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background((Color(hex:"fff")))
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
