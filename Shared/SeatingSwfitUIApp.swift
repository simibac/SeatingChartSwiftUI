//
//  SeatingSwfitUIApp.swift
//  Shared
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

@main
struct SeatingSwfitUIApp: App {
    var sectorChartConfig = SectorChartConfig(
            sectorMap: [
                "SSSSS",
                "_____",
                "AAAAA",
                "_____",
                "BB_CC",
                "BB_CC",
            ],

            sectorDetails: [
                "S": SectorDetailModel(type: .stage, color: .gray, category: "Stage"),
                "A": SectorDetailModel(type: .seating, color: .orange, category: "Sector 1", seatMap: [
                            "aaaaRR___XXXXXX",
                            "aaaaaR___aaaaaX",
                            "aaaaaR___aaaaaa",
                            "bbbbbb___bbbbbX",
                            "bbbbbb___bbbbbX",
                            "bbbbbb___bbbbbb",
                            "_______________",
                            "ccccccc_ccccccc",
                            "_cccccc_cccccc_",
                            "__ccccc_ccccc__",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___"
                        ],
                        columns: ["a", "b", "c", "d", "e", "f", "g", "_", "h", "i", "j", "k", "l", "m", "n"],
                        rows: ["1", "2", "3", "4", "5", "6", "_", "7", "9", "10", "11", "12", "13", "14", "15", "16"]
                ),
                "B": SectorDetailModel(type: .seating, color: .blue, category: "Sector 2", seatMap: [
                            "aaaaRR___XXXXXX",
                            "aaaaaR___aaaaaX",
                            "aaaaaR___aaaaaa",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___"
                        ]
                ),

                "C": SectorDetailModel(type: .seating, color: .green, category: "Sector 3r", seatMap: [
                            "aaaaRR___XXXXXX",
                            "aaaaaR___aaaaaX",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___",
                            "___cccc_cccc___"
                        ]
                ),
            ],

            seatDetails: [
                "a": SeatDetailModel(price: 0.1, color: .blue, category: "Balcony Seat", description: "Best view to enjoy the spectacle", available: true),
                "b": SeatDetailModel(price: 1, color: .purple, category: "VIP Area", description: "Exclusive area with all inclusive drinks and food", available: true),
                "c": SeatDetailModel(price: 1.5, color: .yellow, category: "Standard Seat", available: true),
                "X": SeatDetailModel(price: 0, color: .red, category: "Sold Out", available: false),
                "R": SeatDetailModel(price: 0, color: .gray, category: "Reserved", available: false)

            ],

            currency: "ETH",
            currencyDecimal: 4
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                    .environmentObject(sectorChartConfig)
        }
    }
}
