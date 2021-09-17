//
//  Doctor_PillApp.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 02/09/21.
//

import SwiftUI

@main
struct Doctor_PillApp: App {
    @StateObject var registerManager = RegisterManager()
    @StateObject var tratamentosManager = TratamentosManager()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .colorScheme(.light)
                .environmentObject(registerManager)
                .environmentObject(tratamentosManager)
        }
    }
}
