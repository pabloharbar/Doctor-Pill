//
//  TabBarManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 10/09/21.
//
import Combine

final class TabBarManager: ObservableObject {

    /// This is the index of the item that fires a custom action
    let customActionteminidex: Int

    let objectWillChange = PassthroughSubject<TabBarManager, Never>()

    var itemSelected: Int {
        didSet {
            if itemSelected == customActionteminidex {
                itemSelected = oldValue
                isCustomItemSelected = true
            }
            objectWillChange.send(self)
        }
    }

    /// This is true when the user has selected the Item with the custom action
    var isCustomItemSelected: Bool = false

    init(initialIndex: Int = 1, customItemIndex: Int) {
        self.customActionteminidex = customItemIndex
        self.itemSelected = initialIndex
    }
}
