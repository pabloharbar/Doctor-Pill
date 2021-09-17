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
    
    func getColor() -> Color {
        switch self {
        case .notFound:
            return Color("ScanUnknown")
        case .notRegistered:
            return Color("ScanFailure")
        case .found:
            return Color("ScanSuccess")
        }
    }
    
    func getIconsName() -> [String] {
        switch self {
        case .notFound:
            return ["magnifyingglass", "questionmark"]
        case .notRegistered:
            return ["xmark", "pills"]
        case .found:
            return ["checkmark", "pills"]
        }
    }
}

struct ScanButtonView: View {
    @Binding var scanState: ScanState

    var body: some View {
        HStack(spacing: 0) {
            ForEach(scanState.getIconsName(), id: \.self) { iconName in
                Image(systemName: iconName)
            }
        }
        .font(.system(size: 24))
        .frame(width: 128, height: 80, alignment: .center)
        .background(scanState.getColor())
    }
}

struct ScanButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ScanButtonView(scanState: .constant(.notRegistered))
    }
}
