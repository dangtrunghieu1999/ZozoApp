//
//  TitleTextField.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/22/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

open class TitleTextField: BaseView {
    
    // MARK: - Variables
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    
    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    var textFieldBGColor: UIColor = UIColor.white {
        didSet {
            textField.backgroundColor = textFieldBGColor
        }
    }
    
    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var titleLabelAttributed: NSAttributedString? {
        didSet {
            titleLabel.attributedText = titleLabelAttributed
        }
    }
    
    var textFieldInputView: UIView? {
        didSet {
            textField.inputView = textFieldInputView
        }
    }
    
    var rightTextFieldImage: UIImage? {
        didSet {
            textField.rightImage = rightTextFieldImage
        }
    }
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.body.rawValue)
        label.textColor = UIColor.titleText
        return label
    }()
    
    private (set) lazy var textField: PaddingTextField = {
        let textField = PaddingTextField()
        textField.placeholder = TextManager.signInUserNamePlaceHolder.localized()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.cornerRadius = Dimension.shared.defaultHeightTextField / 2
        textField.layer.masksToBounds = true
        return textField
    }()
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        layoutTitleLabel()
        layoutTextField()
    }
    
    // MARK: - Layout
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
        }
    }
    
    private func layoutTextField() {
        addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(Dimension.shared.mediumMargin)
            make.height.equalTo(Dimension.shared.defaultHeightTextField)
            make.bottom.equalToSuperview()
        }
    }
    
}
