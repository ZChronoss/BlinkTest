//
//  ContentView.swift
//  TestBlink
//
//  Created by Renaldi Antonio on 27/03/24.
//

import SwiftUI
import MapKit

//struct HeaderFontStyle: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//
//    }
//}

struct HeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFProDisplay-Bold", size: 22))
    }
}

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFProDisplay-Regular", size: 16))
    }
}

struct MinStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFProDisplay-Regular", size: 13))
    }
}

extension View{
    var headerStyle: some View{
        self.modifier(HeaderStyle())
    }
    
    var titleStyle: some View{
        self.modifier(TitleStyle())
    }
    
    var minStyle: some View{
        self.modifier(MinStyle())
    }
}

struct ContentView: View {
    @State var startPoint: String = ""
    @State var destPoint: String = ""
    
    let userName: String = "Nabil"
    //    init(){
    //        for familyName in UIFont.familyNames {
    //            print(familyName)
    //
    //            for fontName in UIFont.fontNames(forFamilyName: familyName) {
    //                print("-- \(fontName)")
    //            }
    //        }
    //    }
    
    var body: some View {
        
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack () {
                Image("Logo")
                    .background(
                        Ellipse()
                            .frame(width: 500, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 150)
                    )
                    .foregroundStyle(Color("OrangeBawaan"))
                    .padding(.bottom, 45)
                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundStyle(Color("BiruBawaan"))
                        .clipShape(.rect(
                            topLeadingRadius: 20,
                            topTrailingRadius: 20
                        ))
                    
                    VStack(alignment: .leading){
                        Spacer()
                        
                        Group{
                            Text("Good Morning, \(userName)")
                                .headerStyle
                                .padding(.top, 18)
                            
                            
                            Text("Where would you like to go?")
                                .minStyle
                                .padding(.bottom, 18)
                            
                        }
                        .padding(.horizontal, 20.0)
                        .foregroundStyle(.white)
                        
                        Spacer()
                        
                        ZStack{
                            Rectangle()
                                .foregroundStyle(Color("OrangeBawaan"))
                                .clipShape(.rect(
                                    topLeadingRadius: 20,
                                    topTrailingRadius: 20
                                ))
                            
                            VStack{
                                HStack {
                                    Image(systemName: "mappin.circle.fill")
                                        .foregroundColor(Color.blue)
                                        .padding(.leading, 10)
                                        .padding(.vertical, 10)
                                    
                                    
                                    TextField("Bus Stop", text: $startPoint)
                                        .titleStyle
                                }
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                                HStack {
                                    Image(systemName: "mappin.circle.fill")
                                        .foregroundColor(Color.red)
                                        .padding(.leading, 10)
                                        .padding(.vertical, 10)
                                    
                                    TextField("Bus Destination", text: $destPoint)
                                        .titleStyle
                                }
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                MapView()
                                //                                    .frame(height: 117)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 5)
                                    )
                                    .padding(.top, 10)
                                
                                Spacer()
                                
                            }
                            .padding([.horizontal, .top], 20.0)
                            
                        }
                        
                    }
                }
                .padding(.horizontal, 20)
            }
            
        }
        
    }
}

struct MapView: View {
    @State var userLoc = MapCameraPosition.userLocation(followsHeading: true, fallback: .automatic)
    
    //    @State var mapRegion = MapCameraPosition.region(
    //        MKCoordinateRegion(
    //            center: CLLocationCoordinate2D(latitude: 0.7893, longitude: 113.9213),
    //            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
    //        )
    //    )
    
    @State var busStops : [BusStop] = [
        BusStop(name: "The Breeze", coordinate: CLLocationCoordinate2D(latitude: -6.3013504953850905, longitude: 106.65313907195596)),
        BusStop(name: "ICE 5", coordinate: CLLocationCoordinate2D(latitude: -6.297419790854413, longitude: 106.63615003300868)),
        BusStop(name: "Studento 2", coordinate: CLLocationCoordinate2D(latitude: -6.295203390200567, longitude: 106.64206489435263)),
        BusStop(name: "SML Plaza", coordinate: CLLocationCoordinate2D(latitude: -6.302215345703415, longitude: 106.65121780969461)),
    ]
    
    @State var selectedResult: MKMapItem?
    @State var route: MKRoute?
    
    //    ini starting point pake punya sml plaza
    @State var startingPoint = CLLocationCoordinate2D(latitude: -6.302215345703415, longitude: 106.65121780969461)
    
    //    ini destination pake studento 2
    @State var destinationPoint = CLLocationCoordinate2D(latitude: -6.295203390200567, longitude: 106.64206489435263)
    
    var body: some View {
        Map(selection: $selectedResult){
            UserAnnotation()
            ForEach(busStops){ stop in
                Marker(stop.name, systemImage: "bus.doubledecker.fill", coordinate: stop.coordinate)
                    .tint(Color("StopPin"))
            }
            if let route {
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
            getDirections()
        }
        .onAppear {
            self.selectedResult = MKMapItem(placemark: MKPlacemark(coordinate: self.destinationPoint))
        }
    }
    
    func getDirections() {
        self.route = nil
        
        // Check if there is a selected result
        guard (selectedResult != nil) else { return }
        
        // Create and configure the request
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: self.startingPoint))
        request.destination = self.selectedResult
        
        // Get the directions based on the request
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
}


#Preview {
    ContentView()
}
