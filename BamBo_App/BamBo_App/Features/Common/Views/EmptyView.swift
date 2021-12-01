//
//  EmptyView.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/21/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class EmptyView: BaseView {
    
    // MARK: - Varibles
    
    var messege: String? {
        didSet {
            titleLabel.text = messege
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var font: UIFont = UIFont.systemFont(ofSize: FontSize.body.rawValue) {
        didSet {
            titleLabel.font = font
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = ImageManager.empty
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.lightBodyText
        label.font = UIFont.systemFont(ofSize: FontSize.body.rawValue)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - LifeCycles
    
    override func initialize() {
        layoutImageView()
        layoutTitleLabel()
    }
    
    // MARK: - Public method
    
    func updateImageSize(_ size: CGSize) {
        imageView.snp.updateConstraints { (make) in
            make.width.equalTo(size.width)
            make.height.equalTo(size.height)
        }
    }
    
    // MARK: - Layout
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
        }
    }
}
