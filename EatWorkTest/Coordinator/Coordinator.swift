//
//  Coordinator.swift
//  EatWorkTest
//
//  Created by Иван Марин on 13.09.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var isPresenting: Bool = false
    
    func present() {
        isPresenting = true
    }
    
    func dismiss() {
        isPresenting = false
    }
}
