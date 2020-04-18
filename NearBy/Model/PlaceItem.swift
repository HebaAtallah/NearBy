//
//  PlaceItem.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct PlaceItem: Decodable {
    let venue: VenueItem
    
    private enum CodingKeys: CodingKey {
        case venue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.venue = try container.decode(VenueItem.self, forKey: .venue)
    }
}
