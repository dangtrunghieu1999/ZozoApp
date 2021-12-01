//
//  MenuViewController.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/20/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = UIColor.accentColor
        button.addTarget(self, action: #selector(printTest), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutLogOutButton()
    }
    
    @objc func printTest() {
        AlertManager.shared.showConfirmMessage(mesage: TextManager.statusLogOut.localized())
        { (action) in
            UserManager.logout()
            guard let window = UIApplication.shared.keyWindow else { return }
            window.rootViewController = UINavigationController(rootViewController: SignInViewController())
        }
        
    }
    private func layoutLogOutButton() {
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }

}
