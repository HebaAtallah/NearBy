//
//  LoadingView.swift
//  NearBy
//
//  Created by Heba on 4/18/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    class func instanceFromNib() -> LoadingView {
        guard let nib = UINib(nibName: "LoadingView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as? LoadingView else {
                fatalError("Loading View not found")
        }
        return nib
    }
}
