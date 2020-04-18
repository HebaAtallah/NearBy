//
//  Place.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct Place: Decodable {
    let groups: [PlaceGroup]
    
    private enum CodingKeys: CodingKey {
        case groups
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.groups = try container.decode([PlaceGroup].self, forKey: .groups)
    }
}
