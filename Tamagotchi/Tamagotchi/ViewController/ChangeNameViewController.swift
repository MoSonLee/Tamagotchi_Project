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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc
    private func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private  func setNickName() {
        if userNameTextField.text!.isEmpty {
            view.makeToast("닉네임을 입력해주세요")
        } else {
            userDefaults.set(userNameTextField.text!, forKey: "nickname")
//            DamagotchiMainViewController.nickName = userNameTextField.text!
            self.navigationController?.popViewController(animated: true)
            self.view.window?.makeToast("이름이 변경되었습니다! 뒤로가기를 누르면 확인가능합니다!")
        }
    }
    
    private func setLayout() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style:.plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(setNickName))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "\(userDefaults.string(forKey: "nickname") ?? "대장님") 이름 정하기"
    }
}
