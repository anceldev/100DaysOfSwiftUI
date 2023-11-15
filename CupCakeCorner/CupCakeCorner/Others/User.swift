//
//  User.swift
//  CupCakeCorner
//
//  Created by Ancel Dev account on 14/11/23.
//

import SwiftUI
import Observation

@Observable
class User: Codable {
    var name = "Taylor"
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}

