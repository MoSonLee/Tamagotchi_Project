//
//  UITextField+Extension.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/24.
//

import UIKit

extension UITextField {
    func setTextField(_ text: String) {
        self.textAlignment = .center
        self.borderStyle = .none
        self.keyboardType = .decimalPad
        self.placeholder = text
        self.textAlignment = .center
    }
}
