//
//  PillKeyboard.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 10/09/21.
//

import SwiftUI

enum PillItem: String, CaseIterable {
    case afterMeal
    case beforeMeal
    case afterWakeUp
    case beforeSleep
    case sun
    case doNotEat
    case doNotDrink
    case pill
    
    func getIcons() -> [String] {
        switch self {
        case .afterMeal:
            return ["arrow.right", "tuningfork"]
        case .beforeMeal:
            return ["tuningfork", "arrow.right"]
        case .afterWakeUp:
            return ["sun.max", "bed.double", "arrow.right"]
        case .beforeSleep:
            return ["arrow.right", "moon", "bed.double"]
        case .sun:
            return ["sun.max"]
        case .doNotEat:
            return ["xmark", "tuningfork"]
        case .doNotDrink:
            return ["xmark", "rectangle.portrait"]
        case .pill:
            return ["pills"]
        }
    }
    
    func renderIcons() -> some View {
        let icons = self.getIcons()
        return HStack(spacing: 2) {
            if icons.contains("xmark") {
                ZStack {
                    ForEach(icons, id: \.self) { icon in
                        Image(systemName: icon)
                    }
                }
            } else {
                ForEach(icons, id: \.self) { icon in
                    Image(systemName: icon)
                }
            }
        }
        .padding(7)
        .background(Color(UIColor.systemGray2))
//        .overlay(
//            RoundedRectangle(cornerRadius: cornerRadius)
//                .stroke(Color.primary, lineWidth: 2)
//        )
        .cornerRadius(3)
        .shadow(radius: 0, x: 0, y: 2)
        
    }
}

struct PillKeyboard: View {
    @Binding var showKeyboard: Bool
    @Binding var clickedItem: PillItem?
    
    func renderPill(item: PillItem) -> some View {
        return Button(action: {
            clickedItem = item
        }) {
            item.renderIcons()
        }
        .foregroundColor(.primary)
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(PillItem.allCases, id: \.self) { item in
                        renderPill(item: item)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
            
            Button(action: {
                showKeyboard.toggle()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .background(Color(UIColor.tertiarySystemBackground))
    }
}

struct PillKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        PillKeyboard(showKeyboard: .constant(true), clickedItem: .constant(.afterMeal))
    }
}
