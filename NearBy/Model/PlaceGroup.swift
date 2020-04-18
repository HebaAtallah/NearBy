//
//  PlaceGroup.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct PlaceGroup: Decodable {
    let items: [PlaceItem]
    
    private enum CodingKeys: CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([PlaceItem].self, forKey: .items)
    }
}
