//
//  NetworkManager.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init(){}
    
    func getVideos(){
        guard let url = URL(string: Constants.apiUrl) else { fatalError("InavalidUrl")}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                print("invalid response")
                return
            }
            guard let data = data else {
                print("Invalid data")
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do{
            let response = try decoder.decode(PlayListResponse.self, from: data)
                dump(response)
            }catch{
                
            }
//            do{
//                let playList = try decoder.decode(Playlist.self, from: data)
//                print(playList.items[0].snippet.resourceId.videoId)
//            }catch{
//                print("Error in parsing Jsondata")
//                print(error.localizedDescription)
//            }
        }
        
        task.resume()
    }
}
