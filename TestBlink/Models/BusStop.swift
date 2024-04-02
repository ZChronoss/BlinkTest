import Foundation
import MapKit

var curId = 1

public struct BusStop : Identifiable {
    public var id: Int
    var name: String = ""
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.id = curId
        self.name = name
        self.coordinate = coordinate
        
        curId += 1
    }
    
}
