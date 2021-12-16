//
//  BaseFeedSectionModel.swift
//  BamBo_App
//
//  Created by Bee_MacPro on 01/12/2021.
//  Copyright © 2021 DangTrungHieu. All rights reserved.
//

import UIKit
import IGListKit
import SwiftyJSON

class BaseFeedSectionModel: NSObject, JSONParsable {
    var id:             String?
    var diffID:         String              = Ultilities.randomStringKey()
    var cellDiffID:     String?
    var feedType: NewsFeedType              = .postFeed
    var isShared                            = false
    
    required override init() {
        super.init()
    }
    
    required init(json: JSON) {
        feedType    = NewsFeedType(rawValue: json["Type"].intValue) ?? .postFeed
    }
    
    func buildAllSection() -> [ListDiffable] {
        return []
    }
    
    func getDiffID() -> String {
        return id ?? diffID
    }
    
    func cellSize() -> CGSize {
        return .zero
    }
}

extension BaseFeedSectionModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let newFeedModel = object as? BaseFeedSectionModel {
            return getDiffID() == newFeedModel.getDiffID()
        } else {
            return false
        }
    }
}
