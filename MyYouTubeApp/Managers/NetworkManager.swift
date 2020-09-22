//
//  NetworkManager.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getVideos(completion: @escaping([Video]?, MyError?)->Void){
        guard let url = URL(string: Constants.apiUrl) else{
            completion(nil, .invalidUrl)
            return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil, .invalidData)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(nil, .invalidResponse)
                return
            }
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do{
            let jsonResponse = try decoder.decode(PlayListResponse.self, from: data)
                completion(jsonResponse.items, nil)
            }catch{
                completion(nil, .errorParsing)
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
    
    
    func downLoadImage(urlString: String, completion: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let cachedImage = cache.object(forKey: cacheKey){
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(nil)
                return
            }
            
            guard let downloadedImage = UIImage(data: data) else { completion(nil)
                return
            }
            self.cache.setObject(downloadedImage, forKey: cacheKey)
            completion(downloadedImage)
        }
        
        task.resume()
    }
}
