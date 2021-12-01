//
//  BaseShimmerView.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/21/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit
import Shimmer

open class BaseShimmerView: BaseView, BaseShimmerProtocol {
    
    // MARK: = UI Elements
    
    lazy var shimmeringView: FBShimmeringView = {
        let shimmer = FBShimmeringView()
        shimmer.shimmeringOpacity = 0.7
        shimmer.shimmeringDirection = .left
        shimmer.contentView = shimmerContentView
        shimmer.shimmeringBeginFadeDuration = 0.1
        shimmer.shimmeringEndFadeDuration  = 0.1
        return shimmer
    }()
    
    lazy var shimmerContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.shimmerBGColor
        return view
    }()
    
    lazy var backgroundShimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    // MARK: - Override
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shimmerContentView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    // MARK: - LifeCycles
    
    override func initialize() {
        backgroundColor = UIColor.white
    }

    // MARK: - Layouts
    
    func layoutBackgroundShimmerView() {
        addSubview(backgroundShimmerView)
        backgroundShimmerView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func layoutShimeringView() {
        addSubview(shimmeringView)
        shimmeringView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
