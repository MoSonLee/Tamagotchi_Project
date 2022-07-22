//
//  DamagotchiInitialCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

class DamagotchiInitialCollectionViewCell: UICollectionViewCell {    
    @IBOutlet weak var mainTamagotchiImage: UIImageView!
    @IBOutlet weak var mainTamagotchiLabel: UILabel!
    
    func configureCell(_ data: Tamagotchi) {
        mainTamagotchiLabel.text = data.tamagotchiName
        mainTamagotchiLabel.textAlignment = .center
        mainTamagotchiImage.image = data.tamagotchiImage
        mainTamagotchiLabel.layer.cornerRadius = 5
        mainTamagotchiLabel.adjustsFontSizeToFitWidth = true
        mainTamagotchiLabel.layer.borderWidth = 0.7
        mainTamagotchiLabel.layer.borderColor = UIColor.darkGray.cgColor
    }
}
