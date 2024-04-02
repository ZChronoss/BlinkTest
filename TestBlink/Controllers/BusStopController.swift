//
//  BusStopController.swift
//  TestBlink
//
//  Created by Renaldi Antonio on 02/04/24.
//

import Foundation

public class BusStopController {
    private var busStop: [BusStop] = BusStopRepository().getAll()
    
    func getBusStopById(id: Int) -> BusStop  {
        var returnData = busStop.first(where: { $0.id == id}) ?? busStop[0]
//        print(returnData)
        return returnData
//        return (busStop.first { $0.id == id })!
    }
}
