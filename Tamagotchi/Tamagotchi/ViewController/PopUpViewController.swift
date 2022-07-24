//
//  PopUpViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

final class PopUpViewController: UIViewController {
    
    @IBOutlet weak private var popupImage: UIImageView!
    @IBOutlet weak private var popUpLabel: UILabel!
    @IBOutlet weak private var popUpDescriptionLabel: UILabel!
    @IBOutlet weak private var popUpDividerLabel: UILabel!
    @IBOutlet weak private var popUpCancelButton: UIButton!
    @IBOutlet weak private var popUpStartButton: UIButton!
    @IBOutlet weak private var popUpView: UIView!
    @IBOutlet weak private var buttonStackView: UIStackView!
    
    var tamagotchiImageData: UIImage?
    var tamagotchiTitlText: String?
    var tamagotchiDescription: String?
    
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
        vc.tamagtochiImageData = tamagotchiImageData
        vc.tamagotchiTitlText = tamagotchiTitlText
        vc.tamagotchiDescription = tamagotchiDescription
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setLayout() {
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        popUpLabel.setViewColor()
        popUpView.setViewColor()
        popUpLabel.setLabel(tamagotchiTitlText ?? "")
        popUpDescriptionLabel.setLabelWithoutAdjust(tamagotchiDescription ?? "")
        popUpDividerLabel.addTopBorderWithColor(color: .systemGray, width: 1)
        popUpDividerLabel.text = ""
        popupImage.image = tamagotchiImageData
        popUpView.layer.cornerRadius = 30
        popUpCancelButton.setPopUpButton("취소")
        popUpCancelButton.backgroundColor = .lightGray
        popUpStartButton.setPopUpButton("시작하기")
        buttonStackView.addTopBorderWithColor(color: .lightGray, width: 1)
    }
}
