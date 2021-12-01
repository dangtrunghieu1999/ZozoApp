//
//  Array+Extension.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/21/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        if index < count && index >= 0 {
            return self[index]
        } else {
            return nil
        }
    }
}
