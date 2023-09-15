//
//  CellView.swift
//  EatWorkTest
//
//  Created by Иван Марин on 15.09.2023.
//

import SwiftUI

struct CellView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var data: CellData
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                descriptionAndStatusSection
                
                mainContentSection
                
                if let fieldTitle = data.fieldTitle, let fieldDescription = data.fieldDescription {
                    detailSection(fieldTitle: fieldTitle, fieldDescription: fieldDescription)
                }
                
                Divider()
                
                footerSection
                
                actionButtons
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
        }
        .background(colorScheme == .dark ? Color(red: 0.05, green: 0.05, blue: 0.05) : Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 6)
        .padding(.horizontal, 16)
    }
}

extension CellView {
    var descriptionAndStatusSection: some View {
        HStack {
            if let descriptionStatus = data.descriptionStatus {
                Text(descriptionStatus)
                    .font(.system(size: 16))
                    .kerning(0.7)
                    .foregroundColor(Color(red: 0.88, green: 0.25, blue: 0.33))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            if let titleStatus = data.titleStatus {
                Text(titleStatus)
                    .font(.system(size: 13, weight: .bold))
                    .padding(.horizontal, 7)
                    .padding(.vertical, 2)
                    .background(Color(red: 0.88, green: 0.25, blue: 0.33))
                    .cornerRadius(24)
                    .foregroundColor(.white)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }

    var mainContentSection: some View {
        HStack(alignment: .center, spacing: 20) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 56, height: 56)
                .background(
                    ZStack {
                        if let imageName = data.imageName {
                            imageName
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                )
                .clipped()
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 0) {
                if let title = data.title {
                    Text(title)
                        .font(.system(size: 16))
                        .kerning(0.7)
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
                }

                HStack {
                    if let ratingTitle = data.ratingTitle {
                        Text(ratingTitle)
                            .font(.system(size: 16))
                            .kerning(0.7)
                            .foregroundColor(Color(red: 0.57, green: 0.58, blue: 0.61))
                    }
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(Color(UIColor(red: 1, green: 0.77, blue: 0.04, alpha: 1)))
                        .frame(width: 12, height: 12)
                }

                HStack {
                    if let metroName = data.metroName {
                        Text(metroName)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Circle()
                        .frame(width: 3, height: 3)
                        .foregroundColor(data.metroBranchColor ?? .black)
                }
            }
            .padding(.leading, 0)
            .padding(.trailing, 20)
            .padding(.top, 7)
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    func detailSection(fieldTitle: String, fieldDescription: String) -> some View {
        HStack {
            Text(fieldTitle)
                .font(.system(size: 16))
                .kerning(0.7)
                .background(colorScheme == .dark ? Color.black : Color.white)
                .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
            Text(fieldDescription)
                .font(.system(size: 16))
                .kerning(0.7)
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color(red: 0.57, green: 0.58, blue: 0.61))
        }
        .padding(.top, 15)
    }

    var footerSection: some View {
        HStack {
            if let fieldTitle2 = data.fieldTitle2, let date = data.date {
                VStack(spacing: 0) {
                    Text(fieldTitle2)
                        .font(.system(size: 16))
                        .kerning(0.7)
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
                    
                    Text(date)
                        .font(.system(size: 12))
                        .kerning(0.7)
                        .foregroundColor(Color(red: 0.57, green: 0.58, blue: 0.61))
                        .frame(maxWidth: .infinity, minHeight: 17, maxHeight: 17, alignment: .leading)
                }
                .padding(.vertical, 12)
            }
            
            Spacer()
            
            if data.hasButton {
                Button(action: {
                    coordinator.showDescriptionPage()
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(UIColor(red: 0.57, green: 0.58, blue: 0.61, alpha: 1)))
                        .frame(width: 18, height: 18)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }


    var actionButtons: some View {
        HStack {
            Button(action: {}) {
                Text("Кнопка")
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(Color(red: 0.22, green: 0.5, blue: 1))
                    .cornerRadius(6)
            }
            
            Spacer()
            
            Button(action: {
                self.data.isHeartSelected.toggle()
            }) {
                let lightGray = UIColor(red: 0.57, green: 0.58, blue: 0.61, alpha: 1)
                Image(systemName: data.isHeartSelected ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(data.isHeartSelected ? .red : Color(lightGray))
            }
        }
    }
}



