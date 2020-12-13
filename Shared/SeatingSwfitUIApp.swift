//
//  SeatingSwfitUIApp.swift
//  Shared
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

@main
struct SeatingSwfitUIApp: App {
    var seatingChartConfig = SeatingChartConfig(
        map: [
            "aaaaaa___XXXXXX",
            "aaaaaa___aaaaaX",
            "aaaaaa___aaaaaa",
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
            "___cccc_cccc___",


        ],
        seatDetails: [
            "a":SeatDetailModel(price: 10.0, color: .blue, category:"Balcony Seat", description: "Best view to enjoy the spectacle"),
            "b":SeatDetailModel(price: 20.0, color: .purple, category:"VIP Area", description: "Exclusive area with all inclusive drinks and food"),
            "c":SeatDetailModel(price: 30.0, color: .yellow, category:"Standard Seat"),
            "X":SeatDetailModel(price: 0, color: .gray, category:"Unavailable")
        ],
        columns:["a", "b", "c", "d", "e", "f", "g", "_", "h", "i", "j", "k", "l", "m", "n"],
        rows: ["1", "2", "3", "4", "5", "6", "_", "7", "9", "10", "11", "12", "13", "14", "15", "16"],
        currency: "ETH",
        currencyDecimal: 6
    )
    
//    var seatingChartConfig2 = SeatingChartConfig(
//        
//        sectors: [
//            "SSSSSSSSSSSSSS",
//            "AAAAAAAAAAAAAA",
//            "AAAAAAAAAAAAAA",
//            "______________",
//            "BBBBBB__CCCCCC",
//            "BBBBBB__CCCCCC",
//            "BBBBBB__CCCCCC"
//        ],
//        
//        map: [
//            "aaaaaa__DDDDDD",
//            "aaaaaa__aaaaaD",
//            "aaaaaa__aaaaaa",
//            "bbbbbb__bbbbbD",
//            "bbbbbb__bbbbbD",
//            "bbbbbb__bbbbbb",
//            "______________",
//            "cccccccccccccc",
//            "_cccccccccccc_",
//            "__cccccccccc__",
//            "___cccccccc___"
//
//        ],
//        
//        seatDetails: [
//            "a":SeatDetailModel(price: 10, color: .blue, category:"Balcony Seat"),
//            "b":SeatDetailModel(price: 20, color: .purple, category:"VIP Area"),
//            "c":SeatDetailModel(price: 30, color: .yellow, category:"Standard Seat"),
//        ],
//        sectorDetails:[
//            "S":SectorDetails()
//        ]
//    
//    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(seatingChartConfig)
        }
    }
}
