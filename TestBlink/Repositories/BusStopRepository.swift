import Foundation
import MapKit

public class BusStopRepository : RepositoryProtocol {
    
    public typealias AssociatedModel = BusStop
    
    private let busStops : [BusStop] = [
        BusStop(name: "SML Plaza", coordinate: CLLocationCoordinate2D.smlPlaza),
        BusStop(name: "The Breeze", coordinate: CLLocationCoordinate2D.theBreeze),
        BusStop(name: "ICE 5", coordinate: CLLocationCoordinate2D.ice5),
        BusStop(name: "Studento 2", coordinate: CLLocationCoordinate2D.studento2),
    ]
    
    public func getAll() -> [BusStop] {
        return busStops
    }
    
}
