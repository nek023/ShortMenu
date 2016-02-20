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
        guard let app = NSApp, let mainMenu = app.mainMenu else {
                return
        }
        
        for (index, menuItem) in mainMenu.itemArray.enumerate() {
            if index == 0 { continue }
            
            if let submenu = menuItem.submenu where submenu.title.characters.count > 2 {
                let index = submenu.title.startIndex.advancedBy(2)
                submenu.title = submenu.title.substringToIndex(index)
            }
        }
    }
    
}
