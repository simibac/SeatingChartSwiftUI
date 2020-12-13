//
//  SelectionSheet.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 13.12.20.
//

import SwiftUI

struct SelectionSheetView: View {
    @EnvironmentObject var config:SeatingChartConfig
    @Binding var offset:CGFloat
    
    var body: some View {
        GeometryReader{reader in
            VStack{
                BottomSheet(config:config, offset: $offset, value: (-reader.frame(in: .global).height + 150))
                    .offset(y: config.totalPrice == 0 ? reader.frame(in: .global).height : reader.frame(in: .global).height - CGFloat(140))
                    .offset(y: config.totalPrice == 0 ? CGFloat(0) : offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        
                        withAnimation(.spring()){
                            if value.startLocation.y > reader.frame(in: .global).midX{
                                if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150){
                                    offset = value.translation.height
                                }
                            }
                            
                            if value.startLocation.y < reader.frame(in: .global).midX{
                                if value.translation.height > 0 && offset < 0{
                                    offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                }
                            }
                        }
                    }).onEnded({ (value) in
                        withAnimation(.spring()){
                            if value.startLocation.y > reader.frame(in: .global).midX{
                                if -value.translation.height > reader.frame(in: .global).midX{
                                    offset = (-reader.frame(in: .global).height + 150)
                                    return
                                }
                                offset = 0
                            }
                            
                            if value.startLocation.y < reader.frame(in: .global).midX{
                                if value.translation.height < reader.frame(in: .global).midX{
                                    offset = (-reader.frame(in: .global).height + 150)
                                    return
                                }
                                offset = 0
                            }
                        }
                    }))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
