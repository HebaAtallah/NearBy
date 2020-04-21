//
//  ServiceInfo.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

enum ServiceInfo {
    case clientId
    case clientSecret
    
    var info: String {
        switch self {
        case .clientId:
            return "ZG3UTZPHLX5ZZHBYANXNJOJVRLY54IKBTIPWTLEKLMM43DG0"
        case .clientSecret:
            return "U0FIZQUITKG3SK51BN315ACSRDPKKJHE3Q4XVR5X32BK3G03"
        }
    }
}
