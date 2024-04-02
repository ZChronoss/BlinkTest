//
//  DrawerView.swift
import SwiftUI
import Drawer

struct DrawerView: View {
    @State var heights = [CGFloat(600), CGFloat(100)]
    var body: some View {
        Drawer(heights: $heights){
            ZStack{
                Color.white
                
                VStack{
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 70, height: 5, alignment: .center)
                        .padding(15)
                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                    
                    VStack{
                        Text("Nama Drawer")
                        Text("test")
                    }
                    
                    Spacer()

                        
                }
            }
            
        }.shadow(radius: 50)
    }
}

#Preview {
    DrawerView()
}
