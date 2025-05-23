//
//  GymTrackerApp.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-11.
//

import SwiftUI

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            DayView()
        }
        .modelContainer(for: [WorkoutPlan.self, WorkoutExercise.self])
    }
}

