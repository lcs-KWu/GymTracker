//
//  Workout Model.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import Foundation
import SwiftData

@Model
class WorkoutPlan: Identifiable {
    var id: UUID
    var title: String
    var exercises: [WorkoutExercise]

    init(title: String, exercises: [WorkoutExercise] = []) {
        self.id = UUID()
        self.title = title
        self.exercises = exercises
    }
}

