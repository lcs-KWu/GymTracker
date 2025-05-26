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

    // MARK: Body
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
                
                // New plan
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

}

#Preview {
    DayView()
        .modelContainer(for: [WorkoutPlan.self, WorkoutExercise.self])
}

