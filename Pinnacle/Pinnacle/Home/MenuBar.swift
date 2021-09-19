//
//  MenuBar.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-19.
//

import SwiftUI

struct MenuBar: View {
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
                            .frame(width: 35)
                    }
                    
                    Spacer()
                    Button(action: {
                        menuSelection = 2
                    }) {
                        Image("person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .offset(y:10)
                    }
                }
                .padding([.trailing, .leading], 40)
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
        .frame(height: 130)
    }
}
