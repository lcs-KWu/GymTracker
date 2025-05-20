//
//  ContentView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-11.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        TabView(selection: Binding.constant(2)) {
            
            DayView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Workout Schedule")
                }
                .tag(1)
            
            PlanView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Sets")
                }
                .tag(2)
            
            AddingView()
                .tabItem {
                    Image(systemName: "stopwatch.fill")
                    Text("Add Workout Plan")
                }
                .tag(3)
            
        }
        .preferredColorScheme(.dark)
        .tint(.orange)
    }
}

#Preview {
    LandingView()
}
