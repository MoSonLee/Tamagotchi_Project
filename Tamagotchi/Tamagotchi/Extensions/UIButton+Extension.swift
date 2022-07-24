//
//  UIButton+Extension.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/24.
//

import UIKit

extension UIButton {
    func setButton(_ data: String) {
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 1
        self.tintColor = .systemGray
        self.setTitle(data, for: .normal)
    }
    
    func setPopUpButton(_ data: String) {
        self.setTitle(data, for: .normal)
        self.tintColor = .darkGray
        self.tintColor = .darkGray
        self.addTopBorderWithColor(color: .lightGray, width: 1)
    }
}
