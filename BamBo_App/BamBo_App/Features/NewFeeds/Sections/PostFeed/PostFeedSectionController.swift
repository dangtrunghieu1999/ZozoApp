//
//  PostFeedSectionController.swift
//  BamBo_App
//
//  Created by Bee_MacPro on 16/12/2021.
//  Copyright © 2021 DangTrungHieu. All rights reserved.
//

import UIKit
import IGListKit

class PostFeedSectionModel: BaseFeedSectionModel {}

class PostFeedSectionController: ListSectionController {
    
    override init() {
        super.init()
    }
    
    override func didSelectItem(at index: Int) {
        if index == 0 {
            let viewController = PostFeedDetailViewController()
            UINavigationController.topNavigationVC?.pushViewController(viewController, animated: true   )
        }
    }
    
    override func numberOfItems() -> Int {
        return 2
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 0 {
            guard let cell = collectionContext?.dequeueReusableCell(of: PostFeedCollectionViewCell.self, for: self, at: index) else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionContext?.dequeueReusableCell(of: FeedSectionSecparatorCollectionViewCell.self, for: self, at: index) else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        if index == 0 {
            return CGSize(width: ScreenSize.SCREEN_WIDTH, height: 120)
        } else {
            return FeedSectionSeparatorModel().cellSize()
        }
    }
}
