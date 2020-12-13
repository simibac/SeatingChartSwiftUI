//
//  LegendView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

struct LegendView: View {
    @StateObject var config:SeatingChartConfig

    var body: some View {
        DisclosureGroup(content: {
            VStack{
                ForEach(config.seatDetailsList, id: \.id) { details in
                    if details.description == nil {
                        LegendItem(color:details.color, category:details.category, price:details.price)
                            .padding(.trailing, 20)

                    }else{
                        DisclosureGroup(content: {
                            HStack{
                                Text(details.description!)
                                    .font(.caption)
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 28)
                                Spacer()
                            }

                        }, label: {
                            LegendItem(color:details.color, category:details.category, price:details.price)
                        })
                    }
                }
            }.padding()
        }, label: {
            Label("Legend", systemImage: "map")
        })
    }
}

struct LegendItem: View{
    var color:Color
    var category:String
    var price:Double
    
    var body: some View{
        HStack{
            SeatView(selected: false, color: color)
                .frame(width:20, height:20)
            Text("\(category)")
            Spacer()
            if price != 0 {
                Text("\(String(format: "%.2f", price)) $")
            }
        }
    }
}
