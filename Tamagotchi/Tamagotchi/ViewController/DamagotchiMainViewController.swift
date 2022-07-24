//
//  DamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit
import IQKeyboardManagerSwift

final class DamagotchiMainViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak private var messageImage: UIImageView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var damagotchiLabel: UILabel!
    @IBOutlet weak private var damagotchiLevel: UILabel!
    @IBOutlet weak private var damagotchiImage: UIImageView!
    @IBOutlet weak private var damagotchiFoodTextField: UITextField!
    @IBOutlet weak private var damagatchiWaterTextField: UITextField!
    @IBOutlet weak private var damagotchiFoodButton: UIButton!
    @IBOutlet weak private var damagotchiWaterButton: UIButton!
    
    var tamagtochiImageData: UIImage?
    var tamagotchiTitlText: String?
    var tamagotchiDescription: String?
    
    private var level: Int = 1
    private var rice: Int = 0
    private var water: Int = 0
    private var index: Int = 0
    private var messageArray: [String]?
    private  let tamagtochiFirstLevel = 1
    private let keybord = IQKeyboardManager.shared
    private let userDefaults = UserDefaults.standard
    
    static var nickName: String = UserDefaults.standard.string(forKey: "nickname") ?? "대장님"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UserDefaults.standard.set(true, forKey: "init")
        getUserDefaults()
        setNavigaiton()
        setLevel()
        setDamaghotchiImage()
        setDamagotchiLevel()
    }
    
    override func viewDidLoad() {
        setLayout()
        setNickname()
        self.navigationItem.setHidesBackButton(true, animated: true)
        damagotchiFoodTextField.delegate = self
        damagatchiWaterTextField.delegate = self
        super.viewDidLoad()
    }
    
    @objc
    private func moveToSetting() {
        let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as? SettingTableViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func setNavigaiton() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .systemGray
        navBarAppearance.shadowImage = UIImage()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style:.plain, target: self, action: #selector(moveToSetting))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = DamagotchiMainViewController.nickName + "의 다마고치"
    }
    
    private func setLayout() {
        setNavigaiton()
        view.setViewColor()
        damagotchiFoodTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        messageImage.image = UIImage(named: "bubble")
        setMsessageLabel()
        damagotchiLabel.setLabel(tamagotchiTitlText ?? "")
        setDamagotchiLevel()
        
        damagotchiFoodTextField.setTextField("밥주세용")
        damagatchiWaterTextField.setTextField("물주세용")
        damagatchiWaterTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        
        damagotchiFoodButton.setButton("밥먹기")
        damagotchiWaterButton.setButton("물먹기")
        checkDamagotchi()
        
        keybord.enable = true
        keybord.enableAutoToolbar = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == self.damagotchiFoodTextField  && string.count > 0 {
            let numberOnly = NSCharacterSet.decimalDigits
            let strValid = numberOnly.contains(UnicodeScalar.init(string)!)
            return strValid && text.count <= 10
        }
        return true
    }
    
    @IBAction func foodButtonTapped(_ sender: UIButton) {
        var textedRice: Int?
        textedRice = Int(damagotchiFoodTextField.text!)
        rice += textedRice ?? 1
        setLayout()
        setUserDefaults()
        setLevel()
        setDamaghotchiImage()
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        var textedWater: Int?
        textedWater = Int(damagatchiWaterTextField.text!)
        water += textedWater ?? 1
        setLayout()
        setUserDefaults()
        setLevel()
        setDamaghotchiImage()
    }
    
    @IBAction func keybordDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func setLevel() {
        switch (rice/5) + water/2 {
        case 0..<20:
            return level = 1
        case 20..<30:
            return level = tamagtochiFirstLevel + 1
        case 30..<40:
            return level = tamagtochiFirstLevel + 2
        case 40..<50:
            return level = tamagtochiFirstLevel + 3
        case 50..<60:
            return level = tamagtochiFirstLevel + 4
        case 60..<70:
            return level = tamagtochiFirstLevel + 5
        case 70..<80:
            return level = tamagtochiFirstLevel + 6
        case 80..<90:
            return level = tamagtochiFirstLevel + 7
        case 90..<100:
            return level = tamagtochiFirstLevel + 8
        case 100...:
            return level = tamagtochiFirstLevel + 9
        default:
            return
        }
    }
    
    private func checkDamagotchi() {
        let name = tamagotchiTitlText
        if name == "따끈따끈 다마고치" {
            index = 1
        } else if name == "방실방실 다마고치" {
            index = 2
        } else if name == "반짝반짝 다마고치" {
            index = 3
        } else { print("오류입니다.") }
    }
    
    private func setDamaghotchiImage() {
        let name = damagotchiLabel.text
        if name == "따끈따끈 다마고치" {
            index = 1
        } else if name == "방실방실 다마고치" {
            index = 2
        } else if name == "반짝반짝 다마고치" {
            index = 3
        } else{ print("오류입니다.") }
        
        for i in 1...9 {
            if level == i {
                damagotchiImage.image = UIImage(named: "\(index)-\(i)")
            } else if level == 10 {
                damagotchiImage.image = UIImage(named: "\(index)-\(9)")
            }
        }
    }
    
    private func setUserDefaults() {
        userDefaults.set(level, forKey: "level")
        userDefaults.set(rice, forKey: "rice")
        userDefaults.set(water, forKey: "water")
    }
    
    private func getUserDefaults() {
        level = userDefaults.integer(forKey: "level")
        rice = userDefaults.integer(forKey: "rice")
        water = userDefaults.integer(forKey: "water")
    }
    
    private func setNickname() {
        messageArray = ["밥 그만줘요 \(DamagotchiMainViewController.nickName)", "물 줘요 \(DamagotchiMainViewController.nickName)", "배불러요 말걸지 마세요 \(DamagotchiMainViewController.nickName)", "밥 시간이에요 \(DamagotchiMainViewController.nickName)"]
        DamagotchiMainViewController.nickName = UserDefaults.standard.string(forKey: "nickname") ?? "대장님"
    }
    
    private func setMsessageLabel() {
        messageLabel.text = messageArray?.randomElement() ?? "안녕하세용"
        messageLabel.numberOfLines = 0
        messageLabel.adjustsFontSizeToFitWidth = true
        messageLabel.textAlignment = .center
    }
    
    private func setDamagotchiLevel() {
        damagotchiLevel.text = ("LV\(level) · 밥알\(rice)개 · 물방울\(water)개")
        damagotchiLevel.textAlignment = .center
    }
}
