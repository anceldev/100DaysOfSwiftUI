//
//  Response.swift
//  CupCakeCorner
//
//  Created by Ancel Dev account on 14/11/23.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}


struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
