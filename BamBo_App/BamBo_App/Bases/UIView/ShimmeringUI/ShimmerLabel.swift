//
//  ShimmerLabel.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/21/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

open class ShimmerLabel: BaseShimmerView {
    
    // MARK: - Variables
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    var textColor: UIColor = UIColor.white {
        didSet {
            label.textColor = textColor
        }
    }
    
    var textAlignment: NSTextAlignment = .left {
        didSet {
            label.textAlignment = textAlignment
        }
    }
    
    var font: UIFont = UIFont.systemFont(ofSize: FontSize.h2.rawValue){
        didSet {
            label.font = font
        }
    }
  
    var numberOfLines: Int = 1 {
        didSet {
            label.numberOfLines = numberOfLines
        }
    }
    
    var attributedText: NSAttributedString? {
        didSet {
            label.attributedText = attributedText
        }
    }
    
    // MARK: - UI ELemenets
    private lazy var label = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    override public func initialize() {
        super.initialize()
        layoutLabel()
        label.text = "                      "
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    
    func startShimmer() {
        super.startShimmer()
        label.isHidden = true
    }
    
    func stopShimmer() {
        super.stopShimmer()
        label.isHidden = false
    }
    
    // MARK: - Layouts
    
    private func layoutLabel() {
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
