//
//  KeyboardView.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 10/09/21.
//

import SwiftUI

struct NoAnimationButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.black)
      Spacer()
    }
  }
}

struct KeyboardView: View {
    @State var showKeyboard = false
    @State var clickedItem: PillItem? = nil
    @State var teste: String = ""

    @State var icons: [PillItem] = []
    
    func addIcon(_ icon: PillItem) {
        icons.append(icon)
    }
    
    func removeIcon(at index: Int) {
        icons.remove(at: index)
    }
    
    func clearIcons() {
        if icons.isEmpty {
            showKeyboard = false
        } else {
            icons = []
        }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { _ in
                VStack {
                    Button(action: {
                        UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true) // Hide default keyboard if open
                        showKeyboard.toggle()
                    }) {
                        HStack(spacing: 0) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    
                                    if icons.isEmpty {
                                        Text("Placeholder")
                                            .padding(.leading, 8)
                                            .foregroundColor(Color(UIColor.placeholderText))
                                    } else {
                                        ForEach(Array(zip(icons.indices, icons)), id: \.0) { index, item in
                                            Button(action: { removeIcon(at: index) }) {
                                                item.renderIcons()
                                                    .background(Color(UIColor.systemGray2))
                                                    .cornerRadius(3)
                                            }
                                            .foregroundColor(.primary)
                                        }
                                    }
                                }
                                .padding(clickedItem == nil ? 0 : 8)
                            }
                            Button(action: { clearIcons() }) {
                                Image(systemName: "xmark.circle.fill")
                                    .padding([.top, .bottom, .trailing], 16)
                                    .padding(.leading, 8)
                            }
                            .foregroundColor(Color(UIColor.systemGray))
                            .font(.title3)
                        }
                        .animation(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .cornerRadius(8)
//                        .background(Color.secondary)
//                        .cornerRadius(8)
                    }
                    .buttonStyle(NoAnimationButtonStyle())
                }.padding()
            }
            
            PillKeyboard(showKeyboard: $showKeyboard, clickedItem: $clickedItem)
                .offset(y: showKeyboard ? (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! : UIScreen.main.bounds.height)
        }
        .animation(.default)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: .main) { _ in
                self.showKeyboard = false
            } // Hide Custom keyboard if default keyboard is open
        }
        .onChange(of: clickedItem, perform: { value in
            guard value != nil else { return }
            addIcon(value!)
        })
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
