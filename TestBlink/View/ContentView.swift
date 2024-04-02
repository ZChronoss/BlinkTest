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
                
                /*Image("Logo")
                    .background(
                        Ellipse()
                            .stroke(.gray, lineWidth: 10)
                            .background(Ellipse().fill(Color("OrangeBawaan")))
                            .frame(width: 500, height: 250, alignment: .center)
                            .padding(.bottom, 150)
                    )
                    .padding(.bottom, 45)*/
                
                //Component Logo yg diatas
                LogoView()
                
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
                                    .frame(height: 117)
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
//    @State var mapRegion = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 0.7893, longitude: 113.9213),
//            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
//        )
//    )
    
    @State var userLoc = MapCameraPosition.userLocation(followsHeading: true, fallback: .automatic)
    
    @State var busStop = CLLocationCoordinate2D(latitude: -6.297419790854413, longitude: 106.63615003300868)
    
    var body: some View {
        Map(position: $userLoc){
            UserAnnotation()
            Marker("ICE 5", coordinate: busStop)
        }
        .mapControls{
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
    }
}


#Preview {
    ContentView()
}
