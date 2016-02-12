//
//  ShortMenu.swift
//  ShortMenu
//
//  Created by Katsuma Tanaka on 2016/02/12.
//  Copyright © 2016年 Katsuma Tanaka. All rights reserved.
//

import Cocoa

class ShortMenu: NSObject {
    
    // MARK: - Plugin Entrypoint
    
    class func pluginDidLoad(bundle: NSBundle) {
        NSOperationQueue.mainQueue().addOperationWithBlock {
            shortenMenu()
        }
    }
    
    
    // MARK: - Shortening Menu
    
    class func shortenMenu() {
        guard let mainMenu = NSApp.mainMenu else {
            return
        }
        
        for index in 1..<mainMenu.numberOfItems {
            let menuItem = mainMenu.itemAtIndex(index)!
            
            if let submenu = menuItem.submenu where submenu.title.characters.count > 2 {
                let index = submenu.title.startIndex.advancedBy(2)
                submenu.title = submenu.title.substringToIndex(index)
            }
        }
    }
    
}
