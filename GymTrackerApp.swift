//
//  GymTrackerApp.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-11.
//

import SwiftUI
import SwiftData

@main
struct MyFitnessApp: App {
    var body: some Scene {
        WindowGroup {
            DayView()
        }
        // Inject the SwiftData model into the environment
        .modelContainer(for: [WorkoutPlan.self, WorkoutExercise.self])
    }
}
