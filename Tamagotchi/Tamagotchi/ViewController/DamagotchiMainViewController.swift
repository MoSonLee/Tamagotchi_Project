//
//  DamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit

class DamagotchiMainViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var damagotchiLabel: UILabel!
    @IBOutlet weak var damagotchiLevel: UILabel!
    @IBOutlet weak var damagotchiImage: UIImageView!
    @IBOutlet weak var damagotchiFoodTextField: UITextField!
    @IBOutlet weak var damagatchiWaterTextField: UITextField!
    @IBOutlet weak var damagotchiFoodButton: UIButton!
    @IBOutlet weak var damagotchiWaterButton: UIButton!
    var tamagtochiImageData: UIImage?
    var tamagotchiTitlText: String?
    var tamagotchiDescription: String?
    private var level: Int = 0
    private var rice: Int = 0
    private var water: Int = 0
    private  let tamagtochiFirstLevel = 1
    private var index: Int = 0
    private var messageArray: [String]?
    
    static var nickName: String = UserDefaults.standard.string(forKey: "nickname") ?? "대장님"
    
    override func viewWillAppear(_ animated: Bool) {
        checkDamagotchi()
        setNickname()
        setLevel()
        getUserDefaults()
        setLayout()
        setDamaghotchiImage()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        UserDefaults.standard.set(false, forKey: "init")
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
    
    private func setNavigationBarUnderLine() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .systemGray
        navBarAppearance.shadowImage = UIImage()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setLayout() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style:.plain, target: self, action: #selector(moveToSetting))
        messageLabel.text = messageArray!.randomElement()
        messageLabel.numberOfLines = 0
        messageLabel.adjustsFontSizeToFitWidth = true
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = DamagotchiMainViewController.nickName + "의 다마고치"
        damagotchiFoodTextField.placeholder = "밥주세용"
        damagotchiFoodTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        damagotchiFoodTextField.keyboardType = .decimalPad
        messageImage.image = UIImage(named: "bubble")
        messageLabel.textAlignment = .center
        damagotchiLabel.text = tamagotchiTitlText
        damagotchiLabel.textAlignment = .center
        damagotchiLabel.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        damagotchiLabel.layer.borderWidth = 1
        damagotchiLabel.font = .preferredFont(forTextStyle: .callout, compatibleWith: .none)
        damagotchiLabel.layer.cornerRadius = 3
        damagotchiLabel.adjustsFontSizeToFitWidth = true
        damagotchiLevel.text = ("LV\(level) · 밥알\(rice)개 · 물방울\(water)개")
        damagotchiLevel.textAlignment = .center
        damagotchiLabel.font = .systemFont(ofSize: 14)
        damagatchiWaterTextField.textAlignment = .center
        damagotchiFoodTextField.borderStyle = .none
        damagatchiWaterTextField.keyboardType = .decimalPad
        damagatchiWaterTextField.placeholder = "물주세용"
        damagatchiWaterTextField.borderStyle = .none
        damagotchiFoodTextField.textAlignment = .center
        damagatchiWaterTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        damagotchiFoodButton.tintColor = .systemGray
        damagotchiFoodButton.setImage(UIImage(named: "water"), for: .normal)
        damagotchiFoodButton.setTitle("밥먹기", for: .normal)
        damagotchiFoodButton.layer.borderWidth = 1
        damagotchiFoodButton.layer.cornerRadius = 3
        damagotchiWaterButton.tintColor = .systemGray
        damagotchiWaterButton.layer.borderWidth = 1
        damagotchiWaterButton.layer.cornerRadius = 3
        damagotchiWaterButton.setTitle("물먹기", for: .normal)
        setNavigationBarUnderLine()
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
    
    private func setLevel() {
        switch (rice/5) + water/2 {
        case 0..<20:
            return level = tamagtochiFirstLevel
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
            index = 3
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
        UserDefaults.standard.set(level, forKey: "level")
        UserDefaults.standard.set(rice, forKey: "rice")
        UserDefaults.standard.set(water, forKey: "water")
    }
    
    private func getUserDefaults() {
        level = UserDefaults.standard.integer(forKey: "level")
        rice = UserDefaults.standard.integer(forKey: "rice")
        water = UserDefaults.standard.integer(forKey: "water")
    }
    
    private func setNickname() {
        messageArray = ["밥 그만줘요 \(DamagotchiMainViewController.nickName)", "물 줘요 \(DamagotchiMainViewController.nickName)", "배불러요 말걸지 마세요 \(DamagotchiMainViewController.nickName)", "밥 시간이에요 \(DamagotchiMainViewController.nickName)"]
        DamagotchiMainViewController.nickName = UserDefaults.standard.string(forKey: "nickname") ?? "대장님"
    }
}
