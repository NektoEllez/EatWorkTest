//
//  Coordinator.swift
//  EatWorkTest
//
//  Created by Иван Марин on 13.09.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var currentView: AnyView

    init(startView: AnyView) {
        self.currentView = startView
    }

    func changeView(_ view: AnyView) {
        currentView = view
    }
    
    func showDescriptionPage() {
//        let viewModel = DescriptionViewModel() // создайте этот класс, если он еще не существует
        let view = DetailView(cellData: CellData())
        changeView(AnyView(view))
    }

    func showContentView() {
//        let viewModel = ContentViewModel() // создайте этот класс, если он еще не существует
        let view = ContentView()
        changeView(AnyView(view))
    }

}


