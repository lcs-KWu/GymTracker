
//
//  ContentView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-11.
//

import SwiftUI
import SwiftData

struct LandingView: View {
    // MARK: Stored Properties
    @Environment(\.modelContext) var modelContext
    @Query var workoutPlans: [WorkoutPlan]
    
    // MARK: computed properties
    var body: some View {
        TabView {
            
            // Check and enter plans
            DayView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Plans")
                }
                .tag(1)
            
                .preferredColorScheme(.dark)
                .tint(.orange)
        }
    }
}

#Preview {
    LandingView()
        .modelContainer(for: [WorkoutPlan.self, WorkoutExercise.self])
}
