//
//  MyError.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import Foundation

enum MyError: String, Error{
    case invalidUrl = "Url is invalid. Please try again"
    case invalidResponse = "Invalid response from server"
    case invalidData = "Data received is invalid"
    case errorParsing = "Error in parsing Json"
}
