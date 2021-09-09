//
//  ScanView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI

struct ScanView: View {
    @Binding var recognizedText: String
    @State var hasFoundCorrect = false
    var body: some View {
        ZStack {
            ScanViewController(recognizedText: $recognizedText)
            
            Text(recognizedText)
                .padding()
                .offset(y: 250)

            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.blue.opacity(0.75))
            Image(systemName: hasFoundCorrect ? "checkmark.seal.fill" : "xmark.seal.fill")
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(recognizedText: .constant(""))
    }
}
