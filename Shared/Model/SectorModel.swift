//
// Created by Simon Bachmann on 13.12.20.
//

import Foundation
import SwiftUI

struct SectorModel: Identifiable, Hashable, Equatable {
    var id = UUID()
    var color: Color
    var char: Character
    var seatMap: [String]?
    var sectorMap: [String]?
}
