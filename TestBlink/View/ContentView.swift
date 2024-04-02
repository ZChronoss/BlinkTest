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
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack () {
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


#Preview {
    ContentView()
}
