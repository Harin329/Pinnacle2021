//
//  AddPopover.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct AddPopover: View {
    @Binding var select : Bool
    @Binding var show : Bool
    var body: some View {
        VStack {
            SearchBarAdd(searchText: "")
            HStack {
                Spacer()
                ZStack {
                    Text("Saved")
                        .font(.custom("CircularStd-Medium", size: 18))
                        .foregroundColor(Color(hex: "fff"))
                    Rectangle()
                        .frame(width: 140, height: 2)
                        .foregroundColor(Color(hex:"FFCC54"))
                        .offset(y:20)
                }
                Spacer()
                Spacer()
                Text("Browse")
                    .font(.custom("CircularStd-Medium", size: 18))
                    .foregroundColor(Color(hex: "fff"))
                Spacer()

            }.padding(.vertical,20)
            SongList(select: $select, show: $show)
            Spacer()
        }.padding()
        .padding(.top, 30)
        .background(Color(hex: "101010").opacity(0.8))
        .ignoresSafeArea()
    }
}

struct SongList: View {
    @Binding var select : Bool
    @Binding var show : Bool
    var body: some View {
        VStack {
            Button (action: {
                select = true
                show = false
            }) {
                HStack {
                    Image("playlist1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                    VStack {
                        HStack {
                            Text("Study Beats")
                                .font(.custom("CircularStd-Medium", size: 18))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                        HStack {
                            Text("created by @wesleyli")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                    }
                }
            }
            Button (action: {
                select = true
                show = false
            }) {
                HStack {
                    Image("playlist1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                    VStack {
                        HStack {
                            Text("Study Beats")
                                .font(.custom("CircularStd-Medium", size: 18))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                        HStack {
                            Text("created by @wesleyli")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                    }
                }
            }
            Button (action: {
                select = true
                show = false
            }) {
                HStack {
                    Image("playlist1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                    VStack {
                        HStack {
                            Text("Study Beats")
                                .font(.custom("CircularStd-Medium", size: 18))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                        HStack {
                            Text("created by @wesleyli")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                    }
                }
            }
            Button (action: {
                select = true
                show = false
            }) {
                HStack {
                    Image("playlist1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                    VStack {
                        HStack {
                            Text("Study Beats")
                                .font(.custom("CircularStd-Medium", size: 18))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                        HStack {
                            Text("created by @wesleyli")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                    }
                }
            }
            Button (action: {
                select = true
                show = false
            }) {
                HStack {
                    Image("playlist1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                    VStack {
                        HStack {
                            Text("Study Beats")
                                .font(.custom("CircularStd-Medium", size: 18))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                        HStack {
                            Text("created by @wesleyli")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                    }
                }
            }
            Button (action: {
                select = true
                show = false
            }) {
                HStack {
                    Image("playlist1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                    VStack {
                        HStack {
                            Text("Study Beats")
                                .font(.custom("CircularStd-Medium", size: 18))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                        HStack {
                            Text("created by @wesleyli")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "fff"))
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct SearchBarAdd: View {
    @State var searchText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
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
                .stroke(Color(hex: "#fff"), lineWidth: 2))
    }
}
