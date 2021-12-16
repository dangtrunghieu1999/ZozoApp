//
//  FeedSectionSecparatorCollectionViewCell.swift
//  BamBo_App
//
//  Created by Bee_MacPro on 01/12/2021.
//  Copyright © 2021 DangTrungHieu. All rights reserved.
//

import UIKit

class FeedSectionSecparatorCollectionViewCell: BaseCollectionViewCell {
    
    override func initialize() {
        super.initialize()
        backgroundColor = UIColor.separator
    }
}

// MARK: - ListBindable
extension FeedSectionSecparatorCollectionViewCell {
    override func bindViewModel(_ viewModel: Any) {
        
    }
}
