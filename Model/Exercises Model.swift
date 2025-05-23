//
//  Exercises Model.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-21.
//

import Foundation
import SwiftData

@Model
class WorkoutExercise: Identifiable {
    var id: UUID
    var name: String
    var reps: Int
    var sets: Int

    init(name: String, reps: Int, sets: Int) {
        self.id = UUID()
        self.name = name
        self.reps = reps
        self.sets = sets
    }
}
