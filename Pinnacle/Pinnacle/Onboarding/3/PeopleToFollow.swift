//
//  PeopleToFollow.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct PeopleToFollow: View {
    @ObservedObject var spotifyController: SpotifyController
    @State var recommended: [User] = []
    @State var loadedData3: Bool = false
    @Binding var onboarded : Bool
    @State var selectedTuneIn = false
    @StateObject var screen = Screen()
    
    @State var r1 = false
    @State var r2 = false
    @State var r3 = false
    @State var r4 = false
    @State var r5 = false

    
    var image : String = "https://media-exp1.licdn.com/dms/image/C5603AQER37hJyH_-Nw/profile-displayphoto-shrink_800_800/0/1547516998888?e=1637193600&v=beta&t=_f4NExij6aZg5gbWSUcICbMMbhhc0FvfBhOJMNJHLX8"
    var username : String = "@harinwu"
    var compatibilty : String = "70%"
    var body: some View {
        if (loadedData3 && recommended.count >= 5) {
            VStack {
                HStack {
                    Text("People to follow")
                        .font(.custom("CircularStd-Medium", size: 18))
                    Spacer()
                    Text("3/3")
                        .font(.custom("CircularStd-Medium", size: 18))
                }.padding(.horizontal)
                .padding(.top)
                Rectangle()
                    .frame(height: screen.height / 101.5)
                    .padding()
                HStack {
                    Text("Here are a few people that")
                        .font(.custom("CircularStd-Medium", size: 22))
                    Spacer()
                }.padding(.horizontal)
                .padding(.top, screen.height / 162.4)
                HStack {
                    Text("have similar taste as you.")
                        .font(.custom("CircularStd-Medium", size: 22))
                    Spacer()
                }.padding(.horizontal)
                
                VStack(spacing: 0) {
                    //Row 1
                    HStack {
                        URLImageView(urlString: recommended[0].Image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                            .clipped()
                        VStack {
                            HStack {
                                Text(recommended[0].Name)
                                    .font(.custom("CircularStd-Medium", size: 16))
                                    .background(Rectangle()
                                                    .foregroundColor(Color(hex: "B8FDFF"))
                                                    .frame(height: screen.height / 40.6))
                                Spacer()
                            }
                            HStack {
                                Text(String(format: "%.0f", pow(recommended[0].Compatibility!, 100) * 100) + "%")
                                    .font(.custom("CircularStd-Medium", size: 29))
                                Spacer()
                            }
                        }
                        Button (action: {
                            r1.toggle()
                        }) {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: screen.width / 5.357, height: screen.height / 11.6)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3))
                                .overlay(
                                    Image(systemName: r1 ? "checkmark" : "plus")
                                        .foregroundColor(Color(hex: "fff"))
                                        .font(.system(size: 50)))
                                .padding(.trailing, screen.width / 37.5)
                        }
                    }.padding(.horizontal)
                    
                    //Row 2
                    HStack {
                        VStack {
                            HStack {
                                Text(recommended[1].Name)
                                    .font(.custom("CircularStd-Medium", size: 16))
                                    .background(Rectangle()
                                                    .foregroundColor(Color(hex: "B8FDFF"))
                                                    .frame(height: screen.height / 40.6))
                                Spacer()
                            }
                            HStack {
                                Text(String(format: "%.0f", pow(recommended[1].Compatibility!, 100) * 100) + "%")
                                    .font(.custom("CircularStd-Medium", size: 29))
                                Spacer()
                            }
                        }
                        .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                        HStack {
                            URLImageView(urlString: recommended[1].Image)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                                .clipped()
                            Spacer()
                        }
                        Button (action: {
                            r2.toggle()
                        }) {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: screen.width / 5.357, height: screen.height / 11.6)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3))
                                .overlay(
                                    Image(systemName: r2 ? "checkmark" : "plus")
                                        .foregroundColor(Color(hex: "fff"))
                                        .font(.system(size: 50)))
                                .padding(.trailing, screen.width / 37.5)
                        }
                    }.padding(.horizontal)
                    
                    //Row 3
                    HStack {
                        URLImageView(urlString: recommended[2].Image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                            .clipped()
                        VStack {
                            HStack {
                                Text(recommended[2].Name)
                                    .font(.custom("CircularStd-Medium", size: 16))
                                    .background(Rectangle()
                                                    .foregroundColor(Color(hex: "B8FDFF"))
                                                    .frame(height: screen.height / 40.6))
                                Spacer()
                            }
                            HStack {
                                Text(String(format: "%.0f", pow(recommended[2].Compatibility!, 100) * 100) + "%")
                                    .font(.custom("CircularStd-Medium", size: 29))
                                Spacer()
                            }
                        }
                        Button (action: {
                            r3.toggle()
                        }) {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: screen.width / 5.357, height: screen.height / 11.6)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3))
                                .overlay(
                                    Image(systemName: r3 ? "checkmark" : "plus")
                                        .foregroundColor(Color(hex: "fff"))
                                        .font(.system(size: 50)))
                                .padding(.trailing, screen.width / 37.5)
                        }
                    }.padding(.horizontal)
                    
                    //Row 4
                    HStack {
                        Button (action: {
                            r4.toggle()
                        }) {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: screen.width / 5.357, height: screen.height / 11.6)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3))
                                .overlay(
                                    Image(systemName: r4 ? "checkmark" : "plus")
                                        .foregroundColor(Color(hex: "fff"))
                                        .font(.system(size: 50)))
                                .padding(.leading, screen.width / 37.5)
                        }
                        VStack {
                            HStack {
                                Spacer()
                                Text(recommended[3].Name)
                                    .font(.custom("CircularStd-Medium", size: 16))
                                    .background(Rectangle()
                                                    .foregroundColor(Color(hex: "B8FDFF"))
                                                    .frame(height: screen.height / 40.6))
                            }
                            HStack {
                                Spacer()
                                Text(String(format: "%.0f", pow(recommended[3].Compatibility!, 100) * 100) + "%")
                                    .font(.custom("CircularStd-Medium", size: 29))
                            }
                        }
                        URLImageView(urlString: recommended[3].Image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                            .clipped()
                    }.padding(.horizontal)
                    
                    //Row 5
                    HStack() {
                        Button (action: {
                            r5.toggle()
                        }) {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: screen.width / 5.357, height: screen.height / 11.6)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3))
                                .overlay(
                                    Image(systemName: r5 ? "checkmark" : "plus")
                                        .foregroundColor(Color(hex: "fff"))
                                        .font(.system(size: 50)))
                                .padding(.leading, screen.width / 37.5)
                        }
                        HStack {
                            Spacer()
                            URLImageView(urlString: recommended[4].Image)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                                .clipped()
                        }
                        VStack {
                            HStack {
                                Text(recommended[4].Name)
                                    .font(.custom("CircularStd-Medium", size: 16))
                                    .background(Rectangle()
                                                    .foregroundColor(Color(hex: "B8FDFF"))
                                                    .frame(height: screen.height / 40.6))
                                Spacer()
                            }
                            HStack {
                                Text(String(format: "%.0f", pow(recommended[4].Compatibility!, 100) * 100) + "%")
                                    .font(.custom("CircularStd-Medium", size: 29))
                                Spacer()
                            }
                        }
                        .frame(width: screen.width / 4.167, height: screen.height / 9.022)
                    }.padding(.horizontal)
                }.padding(.top, screen.height / 40.6)
                
                HStack {
                    Spacer()
                    Button(action: {
                        onboarded = true
                    }) {
                        HStack {
                            Text("Let’s tune in!")
                                .font(.custom("CircularStd-Book", size: 16))
                                .foregroundColor(Color(hex: "#101010"))
                                .padding([.vertical], screen.height / 67.667)
                                .frame(width: screen.width / 2.679)
                        }.background(Color(hex: "#fff"))
                        .cornerRadius(30)
                    }
                    Spacer()
                }.padding(.top, screen.height / 32.48)
                
                Spacer()
            }
            .background((Color(hex:"51D8DC")).ignoresSafeArea())
        } else {
            VStack {}
                .onAppear(perform: {
                    while true {
                        if spotifyController.accessToken != nil {
                            getRecommendedUser(spotifyController: spotifyController)
                            break
                        } else {
                            sleep(1)
                        }
                    }
                })
        }
    }
    
    func getRecommendedUser(spotifyController: SpotifyController) {
        
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/recommendUser?userID=" + spotifyController.user_id!)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! [AnyObject]
                        let a = converted_respose[0] as! [[Any]]
                        for item in a {
                            getUserInfo(spotifyController: spotifyController, user: item)
                        }
                        loadedData3 = true
                    }
                }
                return
            }
        }
        .resume()
    }
    
    func getUserInfo(spotifyController: SpotifyController, user: [Any]) {
        print(user)
        let id = user[3] as! String
        guard let url = URL(string: "https://api.spotify.com/v1/users/" + id) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer " + spotifyController.accessToken!, forHTTPHeaderField: "Authorization")
        var name = "Anon"
        var img = image
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! Dictionary<String, Any>
                        print(converted_respose)
                        let a = converted_respose["images"] as! [AnyObject]
                        
                        name = converted_respose["display_name"] as? String ?? "Anon"
                        if (a.count > 0) {
                            img = a[0]["url"] as? String ?? image
                        }
                        
                        let s = User(Name: name, UserID: user[3] as! String, Image: img, Compatibility: Double(user[4] as? Substring ?? "0"))
                        recommended.append(s)
                        print(recommended)
                    }
                    
                }
                
                return
            }
        }
        .resume()
    }
}

//struct PeopleToFollow_Previews: PreviewProvider {
//    static var previews: some View {
//        PeopleToFollow().previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
