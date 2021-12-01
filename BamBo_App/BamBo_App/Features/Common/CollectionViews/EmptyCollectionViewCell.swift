//
//  EmptyCollectionViewCell.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/21/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class EmptyCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    
    var message: String? {
        didSet {
            emptyView.messege = message
        }
    }
    
    var image: UIImage? {
        didSet {
            emptyView.image = image
        }
    }
    
    var imageSize: CGSize = CGSize(width: 90, height: 90) {
        didSet {
            emptyView.updateImageSize(imageSize)
        }
    }
    
    var messegeFont: UIFont = UIFont.systemFont(ofSize: FontSize.body.rawValue) {
        didSet {
            emptyView.font = messegeFont
        }
    }
    
    // MARK: - UI Elements
    
    let emptyView = EmptyView()
    
    // MARK: - LifeCycles
    override func initialize() {
        layoutEmptyView()
    }
    
    private func layoutEmptyView() {
        addSubview(emptyView)
        emptyView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalToSuperview()
        }
    }
}
