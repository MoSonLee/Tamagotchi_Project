//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let userDefaults = UserDefaults.standard
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
        if userDefaults.bool(forKey: .initText)  {
            guard let vc = sb.instantiateViewController(withIdentifier: DamagotchiMainViewController.identifier) as? DamagotchiMainViewController else { return }
            self.window?.rootViewController = UINavigationController(rootViewController: vc)
        } else {
            guard let vc = sb.instantiateViewController(withIdentifier: DamagotchiInitialCollectionViewController.identifier) as? DamagotchiInitialCollectionViewController else { return }
            self.window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        self.window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

