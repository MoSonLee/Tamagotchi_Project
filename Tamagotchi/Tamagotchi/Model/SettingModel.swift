//
//  SettingModel.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit

struct Setting {
    var setting: [SettingModel] = [
        SettingModel(settingText: "내 이름 설정하기", settingRightButtonImage: .chevornRightImage, settingFirstImage: UIImage(systemName: "pencil")),
        SettingModel(settingText: "다마고치 변경하기", settingRightButtonImage: .chevornRightImage, settingFirstImage: UIImage(systemName: "moon.fill")),
        SettingModel(settingText: "데이터 초기화", settingRightButtonImage: .chevornRightImage, settingFirstImage: UIImage(systemName: "arrow.clockwise"))
    ]
}
