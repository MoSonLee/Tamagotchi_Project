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
        settingTextLabel.text = settingModel.setting[data].settingText
        settingFirstImage.image = settingModel.setting[data].settingFirstImage
        settingRightButton.setImage(settingModel.setting[data].settingRightButtonImage, for: .normal)
        settingRightButton.semanticContentAttribute = .forceRightToLeft
        settingRightButton.tintColor = .systemGray
        settingTextLabel.tintColor = .systemGray
        settingFirstImage.tintColor = .systemGray
        self.backgroundColor =  UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
}
