//
//  MapView.swift
//  TestBlink
//
//  Created by Renaldi Antonio on 02/04/24.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    @State var userLoc = MapCameraPosition.userLocation(fallback: .automatic)
    
    @State var busStops : [BusStop] = BusStopRepository().getAll()
    
    @State var selectedResult: Int?
    @State var route: MKRoute?
    
    //    ini starting point pake punya sml plaza
//    @State var startingPoint = CLLocationCoordinate2D.smlPlaza
    
//    ini buat test doang
    @State var startingPoint = CLLocationCoordinate2D(latitude: 40.83657722488077, longitude: 14.306896671048852)
    //    ini destination pake studento 2
//    @State var destinationPoint = CLLocationCoordinate2D.studento2
    
//    ini buat test doang
    @State var destinationPoint = CLLocationCoordinate2D(latitude: 40.849761, longitude: 14.263364)
    
    var body: some View {

        VStack{
            ForEach(busStops) { stop in
                Text("\(stop.id)")
            }
            Text("\(busStops.first(where: {$0.id == selectedResult})?.name)")
            Text("test")
        }
        
        Map(position: $userLoc ,selection: $selectedResult){
//            UserAnnotation()
//            ForEach(busStops, id: \.id){ stop in
//                Marker(stop.name, systemImage: "bus.doubledecker.fill", coordinate: stop.coordinate)
//                    .tint(Color("StopPin")).tag(stop.id)
//            }
            Marker("start", coordinate: startingPoint).tag(1)
            Marker("dest", coordinate: destinationPoint).tag(2)
            
            if let route = route {
                MapPolyline(route)
                    .stroke(.blue, lineWidth: 5)
            }
        }
        .mapControls{
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .onChange(of: selectedResult){
            
//            print("\(BusStopController().getBusStopById(id: selectedResult!).name)")
            getDirections()
        }
        .onAppear {
//            self.selectedResult = MKMapItem(placemark: MKPlacemark(coordinate: self.destinationPoint))
        }
    }
    
    func getDirections() {
        self.route = nil
        
        // Check if there is a selected result
//        guard let selectedResult else { return }
        
        // Create and configure the request
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: self.startingPoint))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: self.destinationPoint))
        request.transportType = .automobile
        
        
        // Get the directions based on the request
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
//            print(response == nil)
            route = response?.routes.first
        }
    }
}

#Preview{
    MapView()
}
