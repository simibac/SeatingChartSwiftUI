//
//  SeatView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

struct SeatView: View {
    var selected:Bool
    var color:Color
    
    var body: some View {
        Rectangle()
            .fill(selected ? .green:color)
            .cornerRadius(3)
    }
}
