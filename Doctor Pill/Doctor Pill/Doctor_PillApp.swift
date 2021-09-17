//
//  Doctor_PillApp.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 02/09/21.
//

import SwiftUI

@main
struct Doctor_PillApp: App {
    @StateObject var tratamentosManager = TratamentosManager()
    @StateObject var tabBarManager = TabBarManager(customItemIndex: 2)
    @StateObject var feedManager = FeedManager()
    @StateObject var scanManager = ScanManager()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .colorScheme(.light)
                .environmentObject(tratamentosManager)
                .environmentObject(tabBarManager)
                .environmentObject(feedManager)
                .environmentObject(scanManager)
        }
    }
}
