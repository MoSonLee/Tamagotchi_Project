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
    
    static var identifier: String {
        "SettingTableViewCell"
    }
    
    private lazy var settingModel = Setting()
    
    func configureCell(_ data: Int) {
        settingTextLabel.text = settingModel.setting[data].settingText
        settingFirstImage.image = settingModel.setting[data].settingFirstImage
        settingRightButton.setImage(settingModel.setting[data].settingRightButtonImage, for: .normal)
        settingRightButton.semanticContentAttribute = .forceRightToLeft
        settingRightButton.tintColor = .systemGray
        settingTextLabel.tintColor = .systemGray
        settingFirstImage.tintColor = .systemGray
        self.backgroundColor =  .backgroundDefaultcolor
    }
}
