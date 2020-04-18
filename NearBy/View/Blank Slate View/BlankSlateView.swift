//
//  BlankSlateView.swift
//  NearBy
//
//  Created by Heba on 4/16/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import UIKit

class BlankSlateView: UIView {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    class func instanceFromNib() -> BlankSlateView {
        guard let nib = UINib(nibName: "BlankSlateView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as? BlankSlateView else {
                fatalError("BlankSlate View not found")
        }
        return nib
    }
}
