//
//  Loading.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct Loading: View {
    @State var angle: Double = 0.0
    @State var isAnimating = false
    @State var scale: CGFloat = 0.5
    
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
                        .frame(width: 15, height: 15)
                        .scaleEffect(scale)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever()) // 1.
                        .onAppear {
                            withAnimation {
                                self.scale = 1
                            }}
                    Circle()
                        .fill(Color(hex: "FFCC54"))
                        .frame(width: 15, height: 15)
                        .scaleEffect(scale)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever()) // 1.
                        .onAppear {
                            withAnimation {
                                self.scale = 1
                            }}
                    Circle()
                        .fill(Color(hex: "FFCC54"))
                        .frame(width: 15, height: 15)
                        .scaleEffect(scale)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever()) // 1.
                        .onAppear {
                            withAnimation {
                                self.scale = 1
                            }}
                }
                .offset(y: -25.0)
                .padding(.trailing,40)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background((Color(hex:"#FA7549")).ignoresSafeArea())
            HStack {
                Spacer()
                Image("arm")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
            }.offset(y: -60)
        }
    }
}



struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
