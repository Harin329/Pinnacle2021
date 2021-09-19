//
//  SpotlightEndpoints.swift
//  Pinnacle
//
//  Created by Harin Wu on 2021-09-18.
//

import Foundation

public var endpoint = "https://pinnacle.harinwu.com/"

struct SongEndpoints {
    static func getTop3(payload: apiPayload) -> [Song]  {
            print("Getting song!!")
            let encoder = JSONEncoder()
            
            let semaphore = DispatchSemaphore (value: 0)
            
            let jsonData = try? encoder.encode(payload)
            
            var request = URLRequest(url: URL(string: endpoint + "getTop")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "GET"
            request.httpBody = jsonData
            
            var songList = [Song]()
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    semaphore.signal()
                    return
                }
                 print(String(data: data, encoding: .utf8)!)
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with:data, options: [])
                    let jsonArray = jsonResponse as? [String: Any]
                    songList = jsonArray!["id"] as? [Song] ?? []
                } catch let parsingError {
                    print("Error", parsingError)
                }
                semaphore.signal()
            }
            
            task.resume()
            semaphore.wait()
            
            return songList
        }
}
