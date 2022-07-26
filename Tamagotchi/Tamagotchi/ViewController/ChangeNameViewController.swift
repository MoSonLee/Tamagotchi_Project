//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/24.
//

import UIKit

final class ChangeNameViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    private let userDefaults = UserDefaults.standard
    static var identifier: String {
        "ChangeNameViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChangeNameView()
    }
    
    @objc
    private func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private  func setNickName() {
        guard let name = userNameTextField.text else { return }
        if name.isEmpty {
            view.makeToast("닉네임을 입력해주세요")
        } else {
            userDefaults.set(name, forKey: .nickname)
            self.navigationController?.popViewController(animated: true)
            self.view.window?.makeToast("이름이 변경되었습니다!")
        }
    }
    
    private func setChangeNameView() {
        view.backgroundColor = .backgroundDefaultcolor
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .chevornLeftImage, style:.plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(setNickName))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "\(userDefaults.string(forKey: .nickname) ?? DamagotchiMainViewController.defaultNickName) 이름 정하기"
    }
}
