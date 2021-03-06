//
//  NearByPlacesModels.swift
//  NearBy
//
//  Created by Heba on 4/18/20.
//  Copyright (c) 2020 Cognitev. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum NearByPlaces {
    struct VenueResponse: Decodable {
        var itemVenue: [VenueItem] = []
        
        private enum CodingKeys: String, CodingKey {
            case groups
            
            enum ItemKeys: String, CodingKey {
                case items
                
                enum VenueKeys: CodingKey {
                    case venue
                }
            }
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            var groupsContainer = try container.nestedUnkeyedContainer(forKey: .groups)
            
            while !groupsContainer.isAtEnd {
                let dataContainer = try groupsContainer.nestedContainer(keyedBy: CodingKeys.ItemKeys.self)
                var itemsContainer = try dataContainer.nestedUnkeyedContainer(forKey: .items)
                
                while !itemsContainer.isAtEnd {
                    let venue = try itemsContainer.nestedContainer(keyedBy: CodingKeys.ItemKeys.VenueKeys.self)
                    let item = try venue.decode(VenueItem.self, forKey: .venue)
                    
                    itemVenue.append(item)
                }
            }
        }
    }
    
    struct ViewModel {
        struct Place {
            let id: String
            let title: String
            let subtitle: String
            let image: String
        }
        
        struct BlankSlate {
            let image: String
            let description: String
        }
    }
}
