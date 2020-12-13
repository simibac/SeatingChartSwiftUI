//
//  SectorDetailsModel.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 13.12.20.
//

import Foundation
import SwiftUI

struct SectorDetailModel: Identifiable, Equatable, Comparable {
    var id = UUID()
    var type: SectorType
    var color: Color
    var category: String
    var description: String?
    var seatMap: [String]?
    var sectionMap: [String]?
    var columns: [String]?
    var rows: [String]?

    static func ==(lhs: SectorDetailModel, rhs: SectorDetailModel) -> Bool {
        lhs.id == rhs.id
    }

    static func <(lhs: SectorDetailModel, rhs: SectorDetailModel) -> Bool {
        lhs.category < rhs.category
    }

    var cellType:CellType{
        switch type{
        case .seating: return .available
        case .stage: return .unavailable
        case .empty: return .empty
        case .section: return .available
        }
    }
}

enum SectorType {
    case stage
    case section
    case seating
    case empty
}