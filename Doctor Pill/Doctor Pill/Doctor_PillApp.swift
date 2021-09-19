//
//  Doctor_PillApp.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 02/09/21.
//

import SwiftUI

@main
struct Doctor_PillApp: App {
//    @StateObject var registerManager = RegisterManager()
    @StateObject var remediosManager = RemediosManager.fullState()
    
    @StateObject var tabBarManager = TabBarManager(customItemIndex: 2)
    @StateObject var feedManager = FeedManager()
    @StateObject var scanManager = ScanManager()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .colorScheme(.light)
//                .environmentObject(registerManager)
                .environmentObject(remediosManager)
                .environmentObject(tabBarManager)
                .environmentObject(feedManager)
                .environmentObject(scanManager)
        }
    }
}
