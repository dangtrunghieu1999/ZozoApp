//
//  Ultilities.swift
//  BamBo_App
//
//  Created by Bee_MacPro on 01/12/2021.
//  Copyright © 2021 DangTrungHieu. All rights reserved.
//

import UIKit

class Ultilities: NSObject {
    public static func randomStringKey() -> String {
        return UUID().uuidString
    }
}
