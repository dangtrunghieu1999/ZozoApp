//
//  BaseCollectionViewHeaderFooterCell.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/20/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class BaseCollectionViewHeaderFooterCell: UICollectionReusableView, Reusable {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        
    }
}
