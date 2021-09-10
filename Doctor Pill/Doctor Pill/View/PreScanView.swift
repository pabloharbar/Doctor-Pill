//
//  PreScanView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 10/09/21.
//

import SwiftUI

struct PreScanView: View {
    @State var isCameraActive = true
    @State var recognizedText = ""
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct PreScanView_Previews: PreviewProvider {
    static var previews: some View {
        PreScanView()
    }
}
