//
//  ViewModel.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-21.
//
import SwiftUI
import SwiftData

class WorkoutPlanViewModel: ObservableObject {
    @Published var plans: [WorkoutPlan] = []

    let modelContext: ModelContext

    init(context: ModelContext) {
        self.modelContext = context
        fetchPlans()
    }

    func fetchPlans() {
        // 拉取plans的逻辑（可以考虑Query替代） 
    }

    func addPlan(title: String) {
        let newPlan = WorkoutPlan(title: title)
        modelContext.insert(newPlan)
        fetchPlans()
    }

    func deletePlan(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(plans[index])
        }
        fetchPlans()
    }
}
