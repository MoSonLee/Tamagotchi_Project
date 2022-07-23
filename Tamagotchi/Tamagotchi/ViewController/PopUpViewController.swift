//
//  PopUpViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var popupImage: UIImageView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var popUpDescriptionLabel: UILabel!
    @IBOutlet weak var popUpDividerLabel: UILabel!
    @IBOutlet weak var popUpCancelButton: UIButton!
    @IBOutlet weak var popUpStartButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var buttonStackView: UIStackView!
    var tamagotchiImageData: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "DamagotchiMainViewController") as? DamagotchiMainViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        vc.damagtochiImageData = tamagotchiImageData
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    func setLayout() {
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        popUpLabel.text =  UserDefaults.standard.string(forKey: "tamagotchiName")
        popUpLabel.textAlignment = .center
        popUpLabel.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        popUpLabel.layer.borderWidth = 1
        popUpLabel.font = .preferredFont(forTextStyle: .callout, compatibleWith: .none)
        popUpLabel.layer.cornerRadius = 3
        popUpLabel.adjustsFontSizeToFitWidth = true
        popUpLabel.font = .systemFont(ofSize: 14)
        popUpDividerLabel.addTopBorderWithColor(color: .systemGray, width: 1)
        popUpDividerLabel.text = ""
        popUpDescriptionLabel.text =  UserDefaults.standard.string(forKey: "tamagochiDescription")
        popUpDescriptionLabel.numberOfLines = 0
        popUpDescriptionLabel.font = .preferredFont(forTextStyle: .callout, compatibleWith: nil)
        popUpDescriptionLabel.font = .systemFont(ofSize: 13)
        popUpDescriptionLabel.textAlignment = .center
        popupImage.image = tamagotchiImageData
        popUpView.layer.cornerRadius = 30
        popUpView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        popUpCancelButton.setTitle("취소", for: .normal)
        popUpCancelButton.tintColor = .darkGray
        popUpStartButton.setTitle("시작하기", for: .normal)
        popUpStartButton.tintColor = .darkGray
        buttonStackView.addTopBorderWithColor(color: .lightGray, width: 1)
        popUpCancelButton.addRightBorderWithColor(color: .lightGray, width: 1)
    }
}
