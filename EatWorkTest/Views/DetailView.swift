//
//  DescriptionPage.swift
//  EatWorkTest
//
//  Created by Иван Марин on 15.09.2023.
//

import SwiftUI

struct DetailView: View {
    var cellData: CellData
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        headerSection
                        
                        detailsSection(title: "Поле 1", description: "Пример текста 123")
                        detailsSection(title: "Поле 1", description: "Пример текста 123")
                        
                        descriptionSection(title: "Заголовок", description: defaultDescription)
                        descriptionSection(title: "Заголовок", description: defaultDescription)
                        descriptionSection(title: "Заголовок", description: defaultDescription)
                    }
                    .padding(.leading, 20)
                }
                .navigationBarTitle(cellData.fieldTitle2 ?? "Название 1", displayMode: .large)
                .navigationBarItems(leading: backButton)
                .overlay(
                            VStack {
                                Spacer() // Пространство между контентом и кнопкой
                                Button(action: {
                                    // Действие при нажатии на кнопку
                                }) {
                                    Text("Кнопка")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.vertical, 11)
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.22, green: 0.5, blue: 1))
                                .cornerRadius(10)
                                .padding(.horizontal, 12)
                            }
                            .padding(.bottom, 20) //, // Отступ снизу
//                            alignment: .bottom
                        )
            }
        }
        .background(colorScheme == .dark ? Color(red: 0.05, green: 0.05, blue: 0.05) : .white)
    }
    
    var backButton: some View {
        Button(action: {
            coordinator.showContentView()
        }) {
            Image(systemName: "arrow.left")
        }
    }
    
    var headerSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                // list/header
                Text("Заголовок ")
                    .font(.system(size: 22) .weight(.bold))
                    .kerning(0.5)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.top, 13)
        .padding(.bottom, 1)
    }
    
    func detailsSection(title: String, description: String) -> some View {
        VStack {
            HStack(alignment: .top, spacing: 24) {
                VStack { // Установите alignment на .leading
                    Text(title)
                        .font(.system(size: 17))
                        .kerning(0.7)
                        .foregroundColor(Color(red: 0.57, green: 0.58, blue: 0.61))
                }
                VStack { // Установите alignment на .leading
                    Text(description)
                        .font(.system(size: 17))
                        .kerning(0.7)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
        }
    }
    
    
    func descriptionSection(title: String?, description: String?) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title ?? "Нет заголовка")
                .font(.system(size: 22) .weight(.bold))
            Text(description ?? "Описание отсутствует")
                .font(.system(size: 18))
                .kerning(0.7)
            
        }
        .padding([.bottom, .top], 20)
    }
    
    var bottomBar: some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            Button(action: {
                
            }) {
                Text("Кнопка")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 11)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.22, green: 0.5, blue: 1))
            .cornerRadius(10)
        }
    }
    
    let defaultDescription: String = """
    Имеется спорная точка зрения, гласящая примерно следующее: явные признаки победы институционализации подвергнуты целой серии независимых исследований. Но высокое качество позиционных исследований требует анализа дальнейших направлений развития!
    """
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        DetailView(cellData: CellData())
    }
}
