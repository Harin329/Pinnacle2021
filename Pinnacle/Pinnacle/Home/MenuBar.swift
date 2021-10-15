//
//  MenuBar.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct MenuBar: View {
    @StateObject var screen = Screen()
    @Binding var menuSelection : Int
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack{
                    Button(action: {
                        menuSelection = 0
                    }) {
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screen.width / 10.714)
                    }
                    
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            menuSelection = 2
                        }
                    }) {
                        Image("person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screen.width / 10.714)
                            .offset(y:screen.height / 81.2)
                    }
                }
                .padding([.trailing, .leading], screen.width / 9.375)
                .padding()
                .background((Color(hex:"000")))
            }
            VStack {
                Button(action: {
                    menuSelection = 1
                }) {
                    Image("add")
                }
                Spacer()
            }.background(Color(.clear))
                
        }.background(Color(.clear))
        .frame(height: screen.height / 6.246)
    }
}
