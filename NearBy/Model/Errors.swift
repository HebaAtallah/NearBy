//
//  Errors.swift
//  NearBy
//
//  Created by Heba on 4/21/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

enum Errors: Swift.Error {
    case noData
    case fail
    
    var title: String {
        switch self {
        case .noData:
            return "No data found !!"
        case .fail:
            return "Something went wrong !!"
        }
    }
    
    var image: String {
        switch self {
        case .noData:
            return "exclamation-button"
        case .fail:
            return "error-icon"
        }
    }
}
