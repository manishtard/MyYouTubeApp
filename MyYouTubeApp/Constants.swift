//
//  Constants.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import Foundation

enum Constants{
    static let apiKey = "AIzaSyA_HzbM50Aq13Z0bs235NCG4ZzklfjuGcc"
    static let playListId = "PL8seg1JPkqgH-ZuXSBBXRGRlnmVtEud04"
    static let apiUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playListId)&key=\(apiKey)"
}
