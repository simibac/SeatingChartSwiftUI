//
//  SeatingConfiguration.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import Foundation
import SwiftUI

class SectorChartConfig: ObservableObject {
    private var _id = UUID()
    private var _sectorMap: [String]
    private var _sectorDetails: [Character: SectorDetailModel]
    private var _seatDetails: [Character: SeatDetailModel]
    private var _currency: String
    private var _currencyDecimal: Int
    private var _layoutColumns: [GridItem]
    private var _layoutRows: [GridItem]
    private var _columnLabelCells = [Cell]()

    @Published var cells = [Cell]()
    @Published var seatingSectors = [SeatingChartConfig]()

    init(sectorMap:[String], sectorDetails:[Character:SectorDetailModel], seatDetails: [Character: SeatDetailModel], currency: String = "$", currencyDecimal: Int = 2) {
        _sectorMap = sectorMap
        _sectorDetails = sectorDetails
        _seatDetails = seatDetails
        _currency = currency
        _currencyDecimal = currencyDecimal

        _layoutColumns = [GridItem](repeating: GridItem(.flexible(), spacing: 0), count: sectorMap[0].count)
        _layoutRows = [GridItem](repeating: GridItem(.flexible(), spacing: 0), count: sectorMap.count)


        // create map
        for r in 0..<sectorMap.count{
            for c in 0..<sectorMap[r].count{
                let coordinate = Coordinate(col: "\(c)", row: "\(r)")
                let char = sectorMap[r][c]
                if let sectorDetail = sectorDetails[char] {
                    cells.append(Cell(coordinate: coordinate, label: String(sectorMap[r][c]), cellType: sectorDetail.cellType, referenceId: char))
                } else {
                    cells.append(Cell(coordinate: coordinate, label: String(sectorMap[r][c]), cellType: .empty))
                }
            }
        }

        // create model
        for (key, value) in sectorDetails{
            if value.type == .seating && value.seatMap != nil{
                seatingSectors.append(SeatingChartConfig(sectorId: value.id, map: value.seatMap!, seatDetails: seatDetails, columns: value.columns ?? [], rows:value.rows ?? []))
            }
        }
        print(seatingSectors.count)
    }


    var selectedSeats: [SeatModel] {
        get {
            var selectedSeats = [SeatModel]()
            for config in seatingSectors{
                selectedSeats.append(contentsOf: config.selectedSeats)
            }
            return selectedSeats
        }
    }

    var totalPrice: Double {
        get {
            selectedSeats
                    .map({ $0.price })
                    .reduce(0, +)
        }
    }

    var seatDetailsList: [SeatDetailModel] {
        get {
            Array(_seatDetails.values.map {
                $0
            }).sorted(by: >)
        }
    }

    func price(amount: Double) -> String {

        let format = "%.\(_currencyDecimal)f"
        let price = String(format: format, amount)

        return "\(price) \(_currency)"
    }

    func toggle(id: UUID){

        for config in seatingSectors{
            for (key, seat) in config.seats{
                if seat.id == id{
                    config.seats[key]!.selected.toggle()
                }
            }
        }
    }

    func coordinate(id: UUID) -> Coordinate{
        for seat in selectedSeats{
            if seat.id == id{
                return seat.coordinate
            }
        }
        return Coordinate(col: "0", row: "0")
    }

    var id:UUID{
        get { _id }
    }

    var sectorMap: [String]{
        get { _sectorMap }
    }
    var sectorDetails: [Character: SectorDetailModel]{
        get { _sectorDetails }
    }
    var seatDetails: [Character: SeatDetailModel]{
        get { _seatDetails }
    }
    var currency: String{
        get { _currency }
    }
    var currencyDecimal: Int{
        get { _currencyDecimal }
    }
    var layoutColumns: [GridItem]{
        get { _layoutColumns }
    }
    var layoutRows: [GridItem]{
        get { _layoutRows }
    }
    var columnLabelCells: [Cell]{
        get { _columnLabelCells }
    }

}

struct Coordinate: Identifiable, Hashable {
    var id = UUID()
    var col: String
    var row: String
}

struct Cell: Identifiable {
    var id = UUID()
    var coordinate: Coordinate
    var label: String
    var cellType: CellType
    var referenceId: Character?
}

enum CellType {
    case label
    case empty
    case available
    case unavailable


}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

