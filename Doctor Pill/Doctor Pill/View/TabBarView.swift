//
//  TabBarView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 10/09/21.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var tabBarManager = TabBarManager(initialIndex: 1, customItemIndex: 2)
    @State var recognizedText = ""
    @State var selectedTab = 1
    
    var body: some View {
        TabView(selection: $tabBarManager.itemSelected) {
            FeedView()
                .tabItem {
                    Label("Minha Rotina", systemImage: "calendar")
                }
                .tag(1)
            
            PreScanView()
                .tabItem {
                    Label("Escaner", systemImage: "camera.fill")
                }
                .tag(2)
            
            HistoricoView()
                .tabItem {
                    Label("Histórico", systemImage: "clock.arrow.circlepath")
                }
                .tag(3)
        }
        .fullScreenCover(isPresented: $tabBarManager.isCustomItemSelected,
                         onDismiss: {
            tabBarManager.itemSelected = 1
        },
             content: {
                ScanView(recognizedText: $recognizedText)
        })
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
