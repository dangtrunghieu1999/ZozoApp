//
//  UIApplication+Exension.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/21/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

public extension UIApplication {
    var topSafeAreaInsets: CGFloat {
        if #available(iOS 11, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.top ?? 0
        }
        return 20
    }
    
    var bottomSafeAreaInsets: CGFloat {
        if #available(iOS 11, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.bottom ?? 0
        }
        return 0
    }
}
