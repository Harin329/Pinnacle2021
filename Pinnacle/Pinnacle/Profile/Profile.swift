//
//  Profile.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct Profile: View {
    @State var follow = false
    @StateObject var screen = Screen()

    var body: some View {
        VStack {
            VStack {
                Image("creator1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width / 1.63)
                    .padding(.top, screen.height / 13.533)
                Text("Harin Wu")
                    .font(.custom("CircularStd-Medium", size: 28))
                Text("@harin.wu")
                    .font(.custom("CircularStd-Medium", size: 18))
                HStack (spacing: 0){
                    Text("Good Game · Dominic Fike ")
                        .font(.custom("CircularStd-Book", size: 16))
                        .foregroundColor(Color(hex:"0D8387"))
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screen.width / 25)
                }
                Button(action: {
                    follow.toggle()
                }) {
                    HStack {
                        Text(follow ? "Following" : "Follow")
                            .font(.custom("CircularStd-Book", size: 16))
                            .foregroundColor(Color(hex: follow ? "#fff" : "#101010"))
                            .padding([.vertical], screen.height / 101.5)
                            .frame(width: screen.width / 3.75)
                    }.background(Color(hex: follow ? "#248487" : "#fff"))
                    .cornerRadius(30)
                }
                Spacer()
            }
            .frame(width: screen.width, height: screen.height / 1.804)
            .background((Color(hex:"51D8DC")))
            VStack{
                Button (action: {
                    var url = URL(string: "spotify://user/12173301288")
                    
                    if UIApplication.shared.canOpenURL(url!){
                        UIApplication.shared.open(url!, options: [:]) { success in
                            print(success)
                        }
                    }
                    else{
                        url = URL(string: "https://open.spotify.com/user/12173301288")
                        
                        if UIApplication.shared.canOpenURL(url!){
                            UIApplication.shared.open(url!, options: [:]) { success in
                                print(success)
                            }
                        }
                    }
                }) {
                    Image("spotify")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screen.width / 1.705)
                        .padding(.top, screen.height / 27.067)
                }
                Image("qr")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width / 1.705)
                Spacer()
            }.frame(width: screen.width, height: screen.height / 2.03)
            .background((Color(hex:"fff")))
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
