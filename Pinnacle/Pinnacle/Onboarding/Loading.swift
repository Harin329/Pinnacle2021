//
//  Loading.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Loading: View {
    @Binding var load : Bool
    @State var angle: Double = 0.0
    @State var isAnimating = false
    @State var scale: CGFloat = 0.5
    @StateObject var screen = Screen()
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.4)
            .repeatForever(autoreverses: false)
    }
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("We are curating your unique feed...")
                        .font(.custom("CircularStd-Medium", size: 16))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image("disc")
                        .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                        .animation(self.foreverAnimation)
                        .onAppear {
                            self.isAnimating = true}
                    Spacer()
                }
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color(hex: "FFCC54"))
                        .frame(width: screen.width / 25, height: screen.width / 25)
                        .scaleEffect(scale)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever()) // 1.
                        .onAppear {
                            withAnimation {
                                self.scale = 1
                            }}
                    Circle()
                        .fill(Color(hex: "FFCC54"))
                        .frame(width: screen.width / 25, height: screen.width / 25)
                        .scaleEffect(scale)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever()) // 1.
                        .onAppear {
                            withAnimation {
                                self.scale = 1
                            }}
                    Circle()
                        .fill(Color(hex: "FFCC54"))
                        .frame(width: screen.width / 25, height: screen.width / 25)
                        .scaleEffect(scale)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever()) // 1.
                        .onAppear {
                            withAnimation {
                                self.scale = 1
                            }}
                }
                .offset(y: -screen.height / 32.48)
                .padding(.trailing, screen.width / 9.375)
            }
            .frame(width: screen.width, height: screen.height)
            .background((Color(hex:"#FA7549")).ignoresSafeArea())
            HStack {
                Spacer()
                Image("arm")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width / 3.75, height: screen.height / 8.12, alignment: .center)
            }.offset(y: -screen.height / 13.533)
        }.onAppear(perform: {
            wait()
        }
        )
    }
    func wait() {
        // Delay of 7.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            load = true
        }
        
    }
}

