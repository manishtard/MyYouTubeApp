//
//  CacheManager.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import Foundation


struct CacheManager {
    
    static var cache: [String: Data] = [:]
    
    static func setVideoCache(_ url: String, _ data: Data){
        cache[url] = data
    }
    
    
    static func getVideoCache(_ url: String) -> Data?{
        return cache[url]
    }
}
