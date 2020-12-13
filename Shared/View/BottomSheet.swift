//
//  PartialSheetWrapper.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 13.12.20.
//

import SwiftUI

struct BottomSheet : View {
    @StateObject var config:SeatingChartConfig
    @State var txt = ""
    @Binding var offset : CGFloat
    var value : CGFloat
  
    var body: some View{
      
        VStack{
          Capsule()
              .frame(width: 50, height: 5)
              .padding(.top)
            
          HStack{
            Text("Selected: \(config.selectedSeats.count)")
                .font(.headline)
                .foregroundColor(Color("systemBlack"))

            Spacer()
            Text("Total: \(String(format: "%.2f", config.totalPrice)) $")
                .font(.headline)
                .foregroundColor(Color(UIColor.systemGray6))
                .padding()
                .background(Color("systemBlack"))
                .cornerRadius(15)
          }
          .padding(.vertical,10)
          .cornerRadius(15)
          .padding(.horizontal)
          
          ScrollView(.vertical, showsIndicators: false){
              LazyVStack(alignment: .leading, spacing: 15) {
                    ForEach(config.selectedSeats, id:\.id){ seat in
                        VStack{
                            HStack{
                                SeatView(selected: false, color: seat.color)
                                    .frame(width:20, height:20)
                                Text("\(config.coordinate(id: seat.id).col)\(config.coordinate(id: seat.id).row) \(config.seatDetails[seat.char]?.category ?? "")")
                                Spacer()
                                if seat.price != 0 {
                                    Text("\(String(format: "%.2f", seat.price)) $")
                                }
                            }
                                .onTapGesture {
                                    withAnimation{
                                        config.toggle(id: seat.id)
                                    }
                                }
                            Divider()
                                .padding(.top,10)
                        }
                    }

                  }
              }
              .padding()
              .padding(.top)
            
            HStack{
                Spacer()
                Text("Checkout")
                    .font(.headline)
                    .foregroundColor(Color(UIColor.systemGray6))
                Spacer()
            }
            .padding()
            .background(Color.accentColor)
            .cornerRadius(15)
            .padding()
            .padding(.bottom, 30)
            

          }
          .background(Color("systemWhite"))
          .cornerRadius(15)
          .shadow(color: Color(.black).opacity(0.3), radius: 10.0)
  }
}
