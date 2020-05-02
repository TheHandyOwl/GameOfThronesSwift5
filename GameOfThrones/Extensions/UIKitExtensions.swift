//
//  UIKitExtensions.swift
//  GameOfThrones
//
//  Created by Carlos on 25/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit


// MARK: - UIVC Extensions

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}

extension UIViewController {
    func wrappedInNavigationWithFormat() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        loadTabBar()
        return nav
    }
}

func loadTabBar() {
    
    let tabBarColor = UIColor.lightGray
    let normalColor = UIColor.gray
    let selectedColor = UIColor.darkGray
    
    // Custom TabBar
    UITabBar.appearance().barTintColor = tabBarColor
    
    // Custom TabBarItem
    let appearance = UITabBarItem.appearance()
    let attributesTextSize: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font : UIFont(name: "American Typewriter", size: 22)!, NSAttributedString.Key.foregroundColor: normalColor
    ]
    appearance.setTitleTextAttributes(attributesTextSize, for: .normal)
    let attributesSelected : [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor : selectedColor
    ]
    appearance.setTitleTextAttributes(attributesSelected, for: .selected)

}


// MARK: - String Extensions

extension String {
    func formatString2DateYYYYMMdd() -> Date {
        let tempDate = DateFormatter()
        tempDate.dateFormat = "YYYY/MM/dd"
        
        return tempDate.date(from: self)!
    }
}


// MARK: - Date Extensions

extension Date {
    func formatDate2StringYYYYMMdd() -> String {
        let tempDate = DateFormatter()
        tempDate.dateFormat = "YYYY/MM/dd"
        
        return tempDate.string(from: self)
    }
}
