//
//  SeatingChartView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI
import PartialSheet

struct SectorChartView: View {
    @EnvironmentObject var config: SectorChartConfig

    @State var selectedSector:UUID = UUID()

    var body: some View {
        VStack() {
            LazyVGrid(columns: config.layoutColumns, spacing: 0) {
                ForEach(config.cells, id: \.id) { cell in
                    if cell.referenceId != nil || cell.referenceId == "_"{
                        SectorCellView(color: config.sectorDetails[cell.referenceId!]!.color)
                            .onTapGesture{
                                selectedSector = config.sectorDetails[cell.referenceId!]!.id
                            }
                    }else{
                        SectorCellView(color: .clear)
                    }
                }
            }
                    .frame(height:300).padding()
            ForEach(config.seatingSectors, id: \.id){ seatingConfig in
                if(selectedSector == seatingConfig.sectorId){
                    SeatingChartView().environmentObject(seatingConfig)
                }
            }
        }
    }
}

struct SectorCellView: View {
    var color:Color
    var body: some View {
        VStack{
            Rectangle()
            .fill(color)
        }
    }
}
