//
//  ViewModel.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-21.
//
// ViewModel.swift
// GymTracker

import Foundation
import SwiftData

@Observable
class WorkoutViewModel {
    private var context: ModelContext
    var workoutPlans: [WorkoutPlan] = []
    
    init(context: ModelContext) {
        self.context = context
        Task {
            await fetchPlans()
        }
    }

    @MainActor
    func fetchPlans() async {
        do {
            workoutPlans = try context.fetch(FetchDescriptor<WorkoutPlan>())
        } catch {
            print("Error fetching plans: \(error)")
        }
    }

    func addPlan(title: String) {
        let newPlan = WorkoutPlan(title: title)
        context.insert(newPlan)
        workoutPlans.append(newPlan)
    }

    func deletePlan(_ plan: WorkoutPlan) {
        context.delete(plan)
        workoutPlans.removeAll { $0.id == plan.id }
    }

    func addExercise(to plan: WorkoutPlan, exercise: WorkoutExercise) {
        if let index = workoutPlans.firstIndex(where: { $0.id == plan.id }) {
            workoutPlans[index].exercises.append(exercise)
        }
    }
}
