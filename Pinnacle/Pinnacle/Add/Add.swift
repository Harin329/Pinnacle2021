//
//  Add.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct Add: View {
    @Binding var menu : Int
    @State var image = "None"
    @State var text = ""
    @State var share = true
    @State var showingPopover = false
    @State var selectedSong = false
    var body: some View {
        VStack {
            HStack {
                Button (action: {
                    menu = 0
                    image = "None"
                }) {                    Image("back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                }
                Spacer()
                Text("New Post")
                    .font(.custom("CircularStd-Medium", size: 18))
                Spacer()
                Button (action: {
                    menu = 0
                    image = "None"
                }) {
                    Text("New Post")
                        .font(.custom("CircularStd-Medium", size: 15))
                        .foregroundColor(Color(hex: "39D9B1"))
                }
            }
            HStack {
                Toggle(isOn: $share, label: {
                    Text("Share to feed")
                        .font(.custom("CircularStd-Medium", size: 15))
                })
            }
            Divider()
            HStack {
                Text("Share to inbox")
                    .font(.custom("CircularStd-Medium", size: 15))
                Spacer()
            }
            Toggles()
            Divider()
            HStack{
                Button (action: {
                    showingPopover = true
                }) {
                    Image(selectedSong ? "list3" : "None")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                }
                VStack {
                    TextField("Write a caption...", text: $text)
                }
            }
            Spacer()
        }.padding()
        .padding(.top, 50)
        .background(Color.white)
        .popover(isPresented: $showingPopover) {
            AddPopover(select: $selectedSong, show: $showingPopover)
        }
    }
}

struct Toggles: View {
    @State var one = false
    @State var two = false
    @State var three = false
    @State var four = false
    var body: some View {
        VStack {
            Toggle(isOn: $one, label: {
                HStack {
                    Image("sophiachoi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Text("Sophia Choi")
                        .font(.custom("CircularStd-Medium", size: 15))
                }
            })
            Toggle(isOn: $two, label: {
                HStack {
                    Image("creator3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Text("Jerry Wu")
                        .font(.custom("CircularStd-Medium", size: 15))
                }
            })
            Toggle(isOn: $three, label: {
                HStack {
                    Image("jennycai")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Text("Jenny Cai")
                        .font(.custom("CircularStd-Medium", size: 15))
                }
            })
            Toggle(isOn: $four, label: {
                Image("emilyliu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                Text("Emily Liu")
                    .font(.custom("CircularStd-Medium", size: 15))
            })
        }
    }
}


