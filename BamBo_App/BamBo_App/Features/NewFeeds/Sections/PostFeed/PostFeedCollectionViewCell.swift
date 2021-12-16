//
//  PostFeedCollectionViewCell.swift
//  BamBo_App
//
//  Created by Bee_MacPro on 16/12/2021.
//  Copyright © 2021 DangTrungHieu. All rights reserved.
//

import UIKit

class PostFeedCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Helper Types
    
    fileprivate enum PostFeedIconType: Int {
        case photo      = 0
        case tagFriends = 1
        case checkIn    = 2
        
        var title: String {
            switch self {
            case .photo:
                return TextManager.image.localized()
            case .tagFriends:
                return TextManager.tagFriend.localized()
            case .checkIn:
                return TextManager.checkIn.localized()
            }
        }
        
        var image: UIImage? {
            switch self {
            case .photo:
                return ImageManager.postPhoto
            case .tagFriends:
                return ImageManager.tagFriend
            case .checkIn:
                return ImageManager.location
            }
        }
    }
    
    // MARK: - Variables
    
    private let avatarWidth: CGFloat = 46
    fileprivate let iconsType: [PostFeedIconType] = [.photo, .tagFriends, .checkIn]
    
    // MARK: - UI ELements
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode         = .scaleAspectFit
        imageView.layer.cornerRadius  = avatarWidth / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor   = UIColor.separator.withAlphaComponent(0.5).cgColor
        imageView.layer.borderWidth   = 0.5
        imageView.image = ImageManager.defaultAvatar
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.whatDoYouThink.localized()
        label.textColor = UIColor.bodyText
        label.font = UIFont.systemFont(ofSize: FontSize.body.rawValue)
        return label
    }()
    
    fileprivate let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separator
        return view
    }()
    
    fileprivate lazy var iconsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: ScreenSize.SCREEN_WIDTH / 3, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerReusableCell(ImageAndTitleCollectionViewCell.self)
        return collectionView
    }()
    
    // MARK: - LifeCycles
    override func initialize() {
        super.initialize()
        layoutAvatarImageView()
        layoutTitleLabel()
        layoutSeparatorView()
        layoutCollectionView()
    }
    
    // MARK: - Layout
    
    private func layoutAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(avatarWidth)
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(avatarImageView)
            make.left.equalTo(avatarImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    
    private func layoutSeparatorView() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
            make.height.equalTo(0.5)
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
        }
    }
    
    private func layoutCollectionView() {
        addSubview(iconsCollectionView)
        iconsCollectionView.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}


// MARK: - UICollectionViewDelegate

extension PostFeedCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            AppRouter.pushToPostFeed(.photo)
//        } else if indexPath.row == 1 {
//            AppRouter.pushToPostFeed(.tagFriend)
//        } else if indexPath.row == 2 {
//            AppRouter.pushToPostFeed(.checkIn)
//        }
    }
}

// MARK: - UICollectionViewDataSource

extension PostFeedCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageAndTitleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        if let iconType = PostFeedIconType(rawValue: indexPath.row) {
            cell.configureDate(iconType.image, iconType.title)
        }
        return cell
    }
}
