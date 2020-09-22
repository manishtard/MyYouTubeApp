//
//  Video.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import Foundation


struct Video: Decodable {
    var title = ""
    var description = ""
    var thumbnailUrl = ""
    var publishedDate: Date
    var videoId = ""
    
    
    enum CodingKeys: String, CodingKey{
        case snippet
        case thumbnails
        case high
        case resourceId
        
        
        case publishedDate = "publishedAt"
        case title
        case description
        case thumbnailUrl = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.publishedDate = try snippetContainer.decode(Date.self, forKey: .publishedDate)
        
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnailUrl = try highContainer.decode(String.self, forKey: .thumbnailUrl)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}


//struct Playlist: Decodable{
//    var items: [Item]
//}
//
//
//struct Item: Decodable {
//    var snippet: Video
//}


//struct VideoProperty: Decodable {
//    var videoId = ""
//}
