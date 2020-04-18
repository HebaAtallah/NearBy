//
//  ItemResponse.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct ItemResponse: Decodable {
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
    
    private enum CodingKeys: CodingKey {
        case prefix, suffix, width, height
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.prefix = try container.decode(String.self, forKey: .prefix)
        self.suffix = try container.decode(String.self, forKey: .suffix)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
    }
}
