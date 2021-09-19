//
//  CreateProfile.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct CreateProfile: View {
    @ObservedObject var spotifyController: SpotifyController
    @Binding var onboarded : Bool
    @State var selected = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Create profile")
                        .font(.custom("CircularStd-Medium", size: 18))
                    Spacer()
                    Text("1/3")
                        .font(.custom("CircularStd-Medium", size: 18))
                }.padding(.horizontal)
                
                ZStack {
                    Rectangle()
                        .frame(height: 8)
                    HStack {
                        Spacer()
                        Rectangle()
                            .fill(Color(hex: "FFF"))
                            .frame(width: 230, height: 8)
                    }
                }.padding()
                
                HStack {
                    Text("Sync with Spotify")
                        .font(.custom("CircularStd-Medium", size: 22))
                    Spacer()
                }.padding()
                HStack {
                    Button(action: {
                        spotifyController.connect()
                    }) {
                        HStack {
                            Text("Log in")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "#101010"))
                                .padding([.vertical],8)
                                .frame(width:100)
                        }.background(Color(hex: "#fff"))
                        .cornerRadius(30)
                    }
                    Spacer()
                }.padding([.horizontal, .bottom])
                
                if (spotifyController.user_id != nil) {
                    HStack {
                        Text("A song that defines you")
                            .font(.custom("CircularStd-Medium", size: 22))
                        Spacer()
                    }.padding()
                    VStack {
                        HStack {
                            Text("According to your Spotify, these are")
                                .font(.custom("CircularStd-Medium", size: 16))
                            Spacer()
                        }
                        HStack {
                            Text("your top 3... Help us narrow it down.")
                                .font(.custom("CircularStd-Medium", size: 16))
                            Spacer()
                        }
                    }.padding(.horizontal)
                    OnboardingSong(spotifyController: spotifyController, selected: $selected)
                }
                Spacer()
                
            }
            .background((Color(hex:"39D9B1")).ignoresSafeArea())
            .opacity(selected ? 0 : 1)
            if (spotifyController.user_id != nil) {
            Taste(spotifyController: spotifyController)
                .offset(x: selected ? 0 : -3000 )
                .animation(.easeIn)
            }
        }
    }
    
    
}

//struct CreateProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateProfile()
//            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
