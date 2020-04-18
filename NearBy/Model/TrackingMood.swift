//
//  TrackingMood.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

enum TrackingMood {
    case realtime
    case singleUpdate
    
    var title: String {
        switch self {
        case .realtime:
            return "Realtime"
        case .singleUpdate:
            return "Single Update"
        }
    }
}
