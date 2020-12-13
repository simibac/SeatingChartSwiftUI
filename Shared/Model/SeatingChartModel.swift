//
//  SeatingConfiguration.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import Foundation
import SwiftUI

class SeatingChartConfig: ObservableObject {
    private var _id = UUID()
    private var _map: [String]
    private var _columns: [String]
    private var _rows: [String]
    var cells = [Cell]()
    @Published var seats = [Coordinate: SeatModel]()
    private var _layoutColumns: [GridItem]
    private var _layoutRows: [GridItem]
    private var _columnLabelCells = [Cell]()
    private var _sectorId: UUID

    init(sectorId: UUID, map: [String], seatDetails: [Character: SeatDetailModel], columns: [String], rows: [String]) {
        _sectorId = sectorId
        _map = map
        _layoutColumns = [GridItem](repeating: GridItem(.flexible()), count: map[0].count + 1)
        _layoutRows = [GridItem](repeating: GridItem(.flexible()), count: map.count + 1)


        _columns = ["_"] // invisible cell for the first column
        if columns.count == 0 {
            _columns += (0..<map[0].count).map({ "\($0)" }) // 1, 2, 3, ...
        } else {
            _columns += columns
        }

        if rows.count == 0 {
            _rows = (65...(65 + map.count)).map({ "\(String(UnicodeScalar($0)!))" }) // A, B, C, ...
        } else {
            _rows = rows
        }

        _columnLabelCells = _columns.map({ Cell(coordinate: Coordinate(col: $0, row: _rows[0]), label: $0, cellType: CellType.label) })

        for r in 0..<map.count {
            cells.append(Cell(coordinate: Coordinate(col: _columns[0], row: _rows[r]), label: _rows[r], cellType: CellType.label))

            for c in 0..<map[r].count {
                let coordinate = Coordinate(col: _columns[c + 1], row: _rows[r])
                let char = map[r][c]
                if let seatDetail = seatDetails[char] {
                    seats[coordinate] = SeatModel(price: seatDetail.price, color: seatDetail.color, char: char, coordinate: coordinate)
                    cells.append(Cell(coordinate: coordinate, label: String(map[r][c]), cellType: seatDetail.available ? .available : CellType.unavailable))
                } else {
                    cells.append(Cell(coordinate: coordinate, label: String(map[r][c]), cellType: CellType.empty))
                }
            }
        }
    }


    var selectedSeats: [SeatModel] {
        get {
            Array(seats.values.map {
                $0
            }).filter {
                $0.selected
            }
        }
    }

    var totalPrice: Double {
        get {
            selectedSeats.map({ $0.price }).reduce(0, +)
        }
    }

    func toggle(coordinate: Coordinate) {
        print(coordinate)
        seats[coordinate]!.selected.toggle()
    }

    func toggle(id: UUID) {
        for (key, value) in seats {
            if value.id == id {
                toggle(coordinate: key)
            }
        }
    }

    func unselect(id: UUID) {
        for (key, value) in seats {
            if value.id == id {
                seats[key]!.selected = false
            }
        }
    }

    func coordinate(id: UUID) -> Coordinate {
        for (key, value) in seats {
            if value.id == id {
                return key
            }
        }
        return Coordinate(col: "0", row: "0")
    }


    var id: UUID {
        get { _id }
    }
    var map: [String] {
        get { _map }
    }
    var columns: [String] {
        get { _columns }
    }
    var rows: [String] {
        get { _rows }
    }
    var layoutColumns: [GridItem] {
        get { _layoutColumns }
    }
    var layoutRows: [GridItem] {
        get { _layoutRows }
    }
    var columnLabelCells: [Cell] {
        get { _columnLabelCells }
    }
    var sectorId:UUID {
        get { _sectorId }
    }
}