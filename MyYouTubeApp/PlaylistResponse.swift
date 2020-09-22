//
//  PlaylistResponse.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import Foundation

struct PlayListResponse: Decodable {
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey{
        case items
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
