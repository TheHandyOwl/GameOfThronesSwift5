//
//  SceneDelegate.swift
//  GameOfThrones
//
//  Created by Carlos on 23/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = UIColor.cyan
        
        // Creamos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Controladores personalizados con vista
        /*
        let housesTableVC = HousesTableViewController(model: houses)
        let seasonsTableVC = SeasonsTableViewController(model: seasons)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [housesTableVC, seasonsTableVC]
         */
        
        // Controllers con genéricos sin vista asociada
        //let tableVC = HousesTableViewController(model: houses).wrappedInNavigation()
        let housesDataSource = DataSources.houseDataSource(model: houses)
        let housesVC = ArrayTableViewController(
            dataSource: housesDataSource,
            delegate: HousesDelegate(),
            title: "Houses",
            style: .plain)
        let seasonsDataSource = DataSources.seasonDataSource(model: seasons)
        let seasonsVC = ArrayTableViewController(
            dataSource: seasonsDataSource,
            delegate: SeasonsDelegate(),
            title: "Seasons",
            style: .plain)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [housesVC, seasonsVC]

        // RootVC
        let rootVC = tabBarController.wrappedInNavigationWithFormat()
        //let rootVC = housesVC
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

