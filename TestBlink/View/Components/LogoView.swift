//
//  LogoView.swift
//  TestBlink
//
//  Created by Ages on 01/04/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(.orangeBawaan)
                .frame(width: 400, height: 200)
                .position(x:200, y:-20)
            
            Image("BackgroundLogo")
                .position(x:200, y:-118)
            
            Image("Logo")
                .position(x:200, y:30)

        }
        .frame(width: 400, height: 80)


        
        
        

    }
}

#Preview {
    LogoView()
}
