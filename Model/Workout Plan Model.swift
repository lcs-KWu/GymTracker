//
//  Workout Model.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftData

 @Model
class WorkoutPlan: Identifiable {
    var title: String
    var done: Bool

    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}


