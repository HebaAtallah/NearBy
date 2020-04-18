//
//  Photo.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let photos: Photos
    
    private enum CodingKeys: CodingKey {
        case photos
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.photos = try container.decode(Photos.self, forKey: .photos)
    }
}
