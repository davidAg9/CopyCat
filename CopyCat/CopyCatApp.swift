//
//  CopyCatApp.swift
//  CopyCat
//
//  Created by Dave Agyakwa on 02/05/2022.
//

import SwiftUI

@main
struct CopyCatApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
