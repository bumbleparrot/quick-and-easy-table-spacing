//
//  ViewController.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/8/22.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Load the storyboard.
        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        
        /// Create the no spaces view controller.
        let noSpacesVC = mainSB.instantiateViewController(withIdentifier: "NoSpacesViewController")
        
        /// Create the spaces view controller.
        let spacesVC = mainSB.instantiateViewController(withIdentifier: "SpacesViewController")
        
        /// Create the tab bar items.
        let firstItem = UITabBarItem()
        firstItem.title = "No Spaces"
        firstItem.image = UIImage(named: "tab-bar-settings")
        firstItem.badgeColor = UIColor.blue
        
        let secondItem = UITabBarItem()
        secondItem.title = "Spaces"
        secondItem.image = UIImage(named: "tab-bar-settings")
        secondItem.badgeColor = UIColor.blue
        
        spacesVC.tabBarItem = secondItem
        noSpacesVC.tabBarItem = firstItem
        
        viewControllers = [noSpacesVC, spacesVC]
        selectedIndex = 0
    }
}

