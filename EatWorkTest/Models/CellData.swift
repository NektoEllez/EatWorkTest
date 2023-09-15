//
//  CellData.swift
//  EatWorkTest
//
//  Created by Иван Марин on 15.09.2023.
//

import SwiftUI

struct CellData: Identifiable {
    var id = UUID()
    var descriptionStatus: String?
    var titleStatus: String?
    var title: String?
    var ratingTitle: String?
    var metroName: String?
    var fieldTitle: String?
    var fieldDescription: String?
    var fieldTitle2: String?
    var date: String?
    var imageName: Image?  // Изменено с [String] на Image?
    var metroBranchColor: Color?
    var isHeartSelected: Bool = false
    var hasButton: Bool = true
    var pageTurning: (() -> Void)?
}
