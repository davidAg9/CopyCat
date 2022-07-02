//
//  AppDelegate.swift
//  CopyCat
//
//  Created by Dave Agyakwa on 02/05/2022.
//

import Foundation
import SwiftUI
import AppKit

class AppDelegate:NSObject , NSApplicationDelegate{
    var statusItem:NSStatusItem?
    var popOver = NSPopover()
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = ContentView()
        popOver.behavior = .transient
        popOver.animates = true
        
        popOver.contentViewController = NSViewController()
        
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        popOver.contentViewController?.view.window?.makeKey()
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let MenuButton  = statusItem?.button{
            MenuButton.image = NSImage(systemSymbolName:  "tray", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
        
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    
    @objc func MenuButtonToggle(sender: AnyObject){
        if popOver.isShown{
            popOver.performClose(sender)
        }
        
        if let  menuButton = statusItem?.button{
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        }
    }

}
