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
                .position(x: 200, y: 10)
            
            Image("BackgroundLogo")
                .position(x: 200, y: -87)
                //.frame(width: 400, height: 110)
            
            Image("Logo")
                .position(x: 80, y: 75)

        }
        .padding(.top, 1)

        
        
        

    }
}

#Preview {
    LogoView()
}
