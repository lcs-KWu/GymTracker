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
    
    init(title: String) {
        self.title = title
        
    }
}


