//
//  NavigationBar.swift
//  TestBlink
//
//  Created by Ages on 01/04/24.
//
import SwiftUI

struct NavigationBar: View {
    var body: some View {
        
        //Component Navigation Bar yg dibawah
        TabView{
            ContentView().tabItem {// Explore
                Image(systemName: "safari.fill")
                Text("Explore")
            }.tag(0)
            ScheduleScreen().tabItem {// Schedule
                Image(systemName: "list.bullet.below.rectangle")
                Text("Schedules")
            }.tag(1)
            FullRoutesScreen().tabItem {// Routes
                Image(systemName: "app.connected.to.app.below.fill")
                Text("Full Routes")
            }.tag(2)
            SettingScreen().tabItem {// Settings
                Image(systemName: "gear")
                Text("Settings")
            }.tag(3)
        }.accentColor(Color(.orangeBawaan))

    }
}

#Preview {
    NavigationBar()
}
