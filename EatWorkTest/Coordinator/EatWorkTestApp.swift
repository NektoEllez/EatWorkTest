//
//  EatWorkTestApp.swift
//  EatWorkTest
//
//  Created by Иван Марин on 13.09.2023.
//

import SwiftUI

@main
struct EatWorkTestApp: App {
    @StateObject private var coordinator = Coordinator(startView: AnyView(ContentView()))
    
    var body: some Scene {
        WindowGroup {
            coordinator.currentView
                .environmentObject(coordinator)
        }
    }
}


