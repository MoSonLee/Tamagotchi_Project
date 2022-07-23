//
//  ChangeNameViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/24.
//

import UIKit

class ChangeNameViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc
    func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func setNickName() {
        if userNameTextField.text!.isEmpty {
            view.makeToast("닉네임을 입력해주세요")
        } else {
            DamagotchiMainViewController.nickName = userNameTextField.text!
            UserDefaults.standard.set(DamagotchiMainViewController.nickName, forKey: "nickname")
            self.navigationController?.popViewController(animated: true)
            self.view.window?.makeToast("이름이 변경되었습니다! 뒤로가기를 누르면 확인가능합니다!")
        }
    }
    
    func setLayout() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style:.plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(setNickName))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "\(DamagotchiMainViewController.nickName) 이름 정하기"
    }
}
