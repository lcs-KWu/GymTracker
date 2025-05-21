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

extension WorkoutPlan {
    
    @MainActor
    static var preview: ModelContainer {
        
        let container = try! ModelContainer(
            for: WorkoutPlan.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        // Add mock data
        container.mainContext.insert(
            WorkoutPlan(title: "leg day ", done: true)
           )
        container.mainContext.insert(
            WorkoutPlan(title: "leg day ", done: false)
        )
           
        container.mainContext.insert(
            WorkoutPlan(title: "leg day ", done: false)
        )
        
            
 
        return container
    }
}
