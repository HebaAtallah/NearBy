//
//  VenueItem.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct VenueItem: Decodable {
    let id: String
    let name: String
    let location: VenueLocation
}
