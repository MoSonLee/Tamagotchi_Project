//
//  UILabel+Extension.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/24.
//

import Foundation
import UIKit

extension UILabel {
    func setLabel(_ data: String) {
        self.textAlignment = .center
        self.layer.borderWidth = 1
        self.font = .preferredFont(forTextStyle: .callout, compatibleWith: .none)
        self.layer.cornerRadius = 3
        self.adjustsFontSizeToFitWidth = true
        self.font = .systemFont(ofSize: 13)
        self.text = UserDefaults.standard.string(forKey: "tamaName")
    }
    
    func setLabelWithoutAdjust(_ data: String) {
        self.text = data
        self.textAlignment = .center
        self.layer.borderWidth = 1
        self.font = .preferredFont(forTextStyle: .callout, compatibleWith: .none)
        self.layer.cornerRadius = 3
        self.font = .systemFont(ofSize: 13)
        self.numberOfLines = 0
    }
}
