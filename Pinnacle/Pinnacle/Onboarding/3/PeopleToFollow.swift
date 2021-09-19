//
//  PeopleToFollow.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

struct PeopleToFollow: View {
    @ObservedObject var spotifyController: SpotifyController
    
    var image : String = "https://media-exp1.licdn.com/dms/image/C5603AQER37hJyH_-Nw/profile-displayphoto-shrink_800_800/0/1547516998888?e=1637193600&v=beta&t=_f4NExij6aZg5gbWSUcICbMMbhhc0FvfBhOJMNJHLX8"
    var username : String = "@harinwu"
    var compatibilty : String = "70%"
    var body: some View {
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
                .frame(height: 8)
                .padding()
            HStack {
                Text("Here are a few people that")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.horizontal)
            .padding(.top, 5)
            HStack {
                Text("have similar taste as you.")
                    .font(.custom("CircularStd-Medium", size: 22))
                Spacer()
            }.padding(.horizontal)
            
            VStack(spacing: 0) {
                //Row 1
                HStack {
                    URLImageView(urlString: image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                    VStack {
                        HStack {
                            Text(username)
                                .font(.custom("CircularStd-Medium", size: 16))
                                .background(Rectangle()
                                                .foregroundColor(Color(hex: "B8FDFF"))
                                                .frame(height: 20))
                            Spacer()
                        }
                        HStack {
                            Text(compatibilty)
                                .font(.custom("CircularStd-Medium", size: 33))
                            Spacer()
                        }
                    }
                    Button (action: {}) {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3))
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color(hex: "fff"))
                                    .font(.system(size: 50)))
                            .padding(.trailing, 10)
                    }
                }.padding(.horizontal)
                
                //Row 2
                HStack {
                    VStack {
                        HStack {
                            Text(username)
                                .font(.custom("CircularStd-Medium", size: 16))
                                .background(Rectangle()
                                                .foregroundColor(Color(hex: "B8FDFF"))
                                                .frame(height: 20))
                            Spacer()
                        }
                        HStack {
                            Text(compatibilty)
                                .font(.custom("CircularStd-Medium", size: 33))
                            Spacer()
                        }
                    }
                    .frame(width: 90, height: 90)
                    HStack {
                        URLImageView(urlString: image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                        Spacer()
                    }
                    Button (action: {}) {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3))
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color(hex: "fff"))
                                    .font(.system(size: 50)))
                            .padding(.trailing, 10)
                    }
                }.padding(.horizontal)
                
                //Row 3
                HStack {
                    URLImageView(urlString: image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                    VStack {
                        HStack {
                            Text(username)
                                .font(.custom("CircularStd-Medium", size: 16))
                                .background(Rectangle()
                                                .foregroundColor(Color(hex: "B8FDFF"))
                                                .frame(height: 20))
                            Spacer()
                        }
                        HStack {
                            Text(compatibilty)
                                .font(.custom("CircularStd-Medium", size: 33))
                            Spacer()
                        }
                    }
                    Button (action: {}) {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3))
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color(hex: "fff"))
                                    .font(.system(size: 50)))
                            .padding(.trailing, 10)
                    }
                }.padding(.horizontal)
                
                //Row 4
                HStack {
                    Button (action: {}) {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3))
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color(hex: "fff"))
                                    .font(.system(size: 50)))
                            .padding(.leading, 10)
                    }
                    VStack {
                        HStack {
                            Spacer()
                            Text(username)
                                .font(.custom("CircularStd-Medium", size: 16))
                                .background(Rectangle()
                                                .foregroundColor(Color(hex: "B8FDFF"))
                                                .frame(height: 20))
                        }
                        HStack {
                            Spacer()
                            Text(compatibilty)
                                .font(.custom("CircularStd-Medium", size: 33))
                        }
                    }
                    URLImageView(urlString: image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                }.padding(.horizontal)
                
                //Row 5
                HStack(spacing: 0) {
                    Button (action: {}) {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3))
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color(hex: "fff"))
                                    .font(.system(size: 50)))
                            .padding(.leading, 10)
                    }
                    HStack {
                        Spacer()
                        URLImageView(urlString: image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                    }
                    VStack {
                        HStack {
                            Text(username)
                                .font(.custom("CircularStd-Medium", size: 16))
                                .background(Rectangle()
                                                .foregroundColor(Color(hex: "B8FDFF"))
                                                .frame(height: 20))
                            Spacer()
                        }
                        HStack {
                            Text(compatibilty)
                                .font(.custom("CircularStd-Medium", size: 33))
                            Spacer()
                        }
                    }
                    .frame(width: 90, height: 90)
                }.padding(.horizontal)
            }.padding(.top, 20)
            
            HStack {
                Spacer()
                Button(action: {
                }) {
                    HStack {
                        Text("Let’s tune in!")
                            .font(.custom("CircularStd-Book", size: 16))
                            .foregroundColor(Color(hex: "#101010"))
                            .padding([.vertical],12)
                            .frame(width:140)
                    }.background(Color(hex: "#fff"))
                    .cornerRadius(30)
                }
                Spacer()
            }.padding(.top,25)
            
            Spacer()
        }
        .background((Color(hex:"51D8DC")).ignoresSafeArea())
    }
    
    func getRecommendedUser(spotifyController: SpotifyController) {
        let parameters = "{\n    \"UserID\": \"" + self.spotifyController.user_id! + "\",\n    \"UserName\": \"" + self.spotifyController.display_name! + "\",\n    \"Token\": \"" + self.spotifyController.accessToken! + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://pinnacle.harinwu.com/getTopArtists")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
                    DispatchQueue.main.async {
                        let converted_respose = response as! [AnyObject]
                        let a = converted_respose[0]["items"] as! [AnyObject]
                        for item in a {
                            
                            //                            print(item["name"])
                            //                            print(item["id"])
                            let a = item["images"] as! [AnyObject]
                            //                            print(d[0]["url"])
                            let s = Artist(Name: item["name"] as! String, ID: item["id"] as! String, Image: a[0]["url"] as! String)
                            topArtists.append(s)
                            print(topArtists)
                        }
                        loadedData2 = true
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
