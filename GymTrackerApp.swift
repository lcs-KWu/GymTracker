//
//  GymTrackerApp.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-11.
//

import SwiftUI

@main
struct GymTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
                .modelContainer(for: WorkoutPlan.self)
        }
    }
}
