//
//  DayView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftUI
import SwiftData

struct DayView: View {

    // MARK: Stored Properties
    @Environment(\.modelContext) var modelContext
    @Query var workoutPlans: [WorkoutPlan]
    
    @State private var newTitle: String = ""

    // MARK: computed properties 
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(workoutPlans) { plan in
                        NavigationLink(destination: ExerciseListView(plan: plan)) {
                            Text(plan.title)
                                .foregroundColor(.white)
                        }
                    }
                    .onDelete(perform: deletePlan)
                }
                .listStyle(.plain)
                
                //add new plan
                HStack {
                    TextField("New Plan Title", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        addWorkoutPlan()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .disabled(newTitle.isEmpty)
                }
                .padding()
            }
            .navigationTitle("Workout Plans")
        }
        .preferredColorScheme(.dark)
        .tint(.orange)
    }

    // MARK: Functions
    
    func addWorkoutPlan() {
        let newPlan = WorkoutPlan(title: newTitle)
        modelContext.insert(newPlan)
        newTitle = ""
    }
    
    func deletePlan(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(workoutPlans[index])
        }
    }
}

#Preview {
    DayView()
        .modelContainer(for: [WorkoutPlan.self, WorkoutExercise.self])
}

