//
//  PaperViewController-Actions.swift
//  paperViewController
//
//  Created by Jonathan Yu on 2/29/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

extension PaperViewController: UITabBarDelegate {
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch item.tag {
        case 1:
            setFont()
        case 2:
            setFontSize()
        default:
            break
        }
    }
    
    func setFont() {
        print("font changed!")
    }
    
    func setFontSize() {
        print("font size changed!")
    }
    
}