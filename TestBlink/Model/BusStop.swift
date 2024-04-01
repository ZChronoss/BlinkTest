//
//  BusStop.swift
//  TestBlink
//
//  Created by Renaldi Antonio on 01/04/24.
//

import Foundation
import MapKit

var stopId = 1

struct BusStop : Identifiable{
    var id: Int
    var name : String
    var coordinate : CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.id = stopId
        self.name = name
        self.coordinate = coordinate
        
        stopId += 1
    }
}
