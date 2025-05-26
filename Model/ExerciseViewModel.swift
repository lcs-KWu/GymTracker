//
//  ExerciseViewModel.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-23.
//

import Foundation
import SwiftData

@Observable
class ExerciseListViewModel {
    
    var workoutPlan: WorkoutPlan
    var context: ModelContext
    
    init(plan: WorkoutPlan, context: ModelContext) {
        self.workoutPlan = plan
        self.context = context
    }
    
    // 修改函数参数，接收 name、reps 和 sets
    func addExercise(name: String, reps: Int, sets: Int) {
        let newExercise = WorkoutExercise(name: name, reps: reps, sets: sets)
        workoutPlan.exercises.append(newExercise)
        context.insert(newExercise)
        save()
    }
    
    func deleteExercise(_ exercise: WorkoutExercise) {
        if let index = workoutPlan.exercises.firstIndex(of: exercise) {
            workoutPlan.exercises.remove(at: index)
            context.delete(exercise)
            save()
        }
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            print("Error saving changes: \(error)")
        }
    }
}
