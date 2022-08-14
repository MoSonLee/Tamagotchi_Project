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
    
    static var identifier: String {
        "PopUpViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpView()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: DamagotchiMainViewController.identifier) as? DamagotchiMainViewController else { return }
        vc.tamagtochiImageData = tamagotchiImageData
        vc.tamagotchiTitlText = tamagotchiTitlText
        vc.tamagotchiDescription = tamagotchiDescription
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setPopUpView() {
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        popUpLabel.backgroundColor = .backgroundDefaultcolor
        popUpView.backgroundColor = .backgroundDefaultcolor
        popUpLabel.text = tamagotchiTitlText
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
