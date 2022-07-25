//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingFirstImage: UIImageView!
    @IBOutlet weak var settingTextLabel: UILabel!
    @IBOutlet weak var settingRightButton: UIButton!
    
    var settingModel = Setting()
    
    func configureCell(_ data: Int) {
        settingTextLabel.text = settingModel.settingTextList[data]
        settingFirstImage.image = settingModel.settingFirstImage[data]
        settingRightButton.setImage(settingModel.settingRightButton, for: .normal)
        settingRightButton.semanticContentAttribute = .forceRightToLeft
        settingRightButton.tintColor = .systemGray
        settingTextLabel.tintColor = .systemGray
        settingFirstImage.tintColor = .systemGray
    }
}
