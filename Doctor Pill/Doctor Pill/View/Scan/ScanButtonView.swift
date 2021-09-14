//
//  ScanButtonView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

enum ScanState {
    case notFound
    case notRegistered
    case found
}

struct ScanButtonView: View {
    @Binding var scanState: ScanState
    var body: some View {
        makeScanButton(scanState: scanState)
    }
}

@ViewBuilder func makeScanButton(scanState: ScanState) -> some View {
    switch scanState {
    case .notFound:
        Text("?")
            .font(.system(size: 24))
            .frame(width: 128, height: 80, alignment: .center)
            .background(Color.yellow)
    case .notRegistered:
        HStack {
            Image(systemName: "xmark")
            Image(systemName: "pills")
        }
        .font(.system(size: 24))
        .frame(width: 128, height: 80, alignment: .center)
        .background(Color.red)
    case .found:
        HStack {
            Image(systemName: "checkmark")
            Image(systemName: "pills")
        }
        .font(.system(size: 24))
        .frame(width: 128, height: 80, alignment: .center)
        .background(Color.green)
    }
}

struct ScanButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ScanButtonView(scanState: .constant(.notRegistered))
    }
}
