//
//  ContentView.swift
//  EatWorkTest
//
//  Created by Иван Марин on 13.09.2023.

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    @State private var searchText = ""
    
    @State private var cellDatas: [CellData] = [
        
        CellData(
            descriptionStatus: "Пояснение статуса",
            titleStatus: "Статус",
            title: "Заголовок",
            ratingTitle: "Текст 1.1",
            metroName: "Текст 1.2",
            fieldTitle: "Название",
            fieldDescription: "123",
            fieldTitle2: "Название 1",
            date: "15.09.2023",
            imageName: Image("testImage"),
            metroBranchColor: Color(UIColor(red: 0.92, green: 0.27, blue: 0.35, alpha: 1)),
            hasButton: true
        ),
        CellData(
            title: "Заголовок",
            ratingTitle: "Рейтинг 4.9",
            metroName: "Метро",
            fieldTitle: "Название",
            fieldDescription: "123",
            imageName: Image("testImage"),
            metroBranchColor: Color(UIColor(red: 0.22, green: 0.14, blue: 0.71, alpha: 1)),
            hasButton: false
        ),
        
        CellData(
            descriptionStatus: "Новый статус",
            titleStatus: "Статус",
            title: "Заголовок",
            ratingTitle: "Рейтинг 4.8",
            metroName: "Метро",
            fieldTitle: "Название",
            fieldDescription: "123",
            fieldTitle2: "Название 1",
            date: "15.09.2023",
            imageName: Image("testImage"),
            metroBranchColor: .green,
            hasButton: true
        )
    ]
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(cellDatas.indices, id: \.self) { index in
                            CellView(data: $cellDatas[index])
                        }
                    }
                }
                .navigationBarTitle("Вакансии", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.isDarkMode.toggle()
                }) {
                    Text(isDarkMode ? "Светлая" : "Темная")
                })
            }
            .searchable(text: $searchText)
            .tabItem {
                Label("Раздел 1", systemImage: "briefcase")
                    .environment(\.symbolVariants, .none)
                
            }
            
            Text("Другая вкладка")
                .tabItem {
                    Label("Раздел 2", systemImage: "heart")
                        .environment(\.symbolVariants, .none)
                }
        }
        .accentColor(.blue)
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

