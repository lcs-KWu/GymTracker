//
//  PlanView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ExerciseListView: View {
    let plan: WorkoutPlan
    @State private var newExerciseName = ""
    @State private var reps = ""
    @State private var sets = ""

    var body: some View {
        VStack {
            List {
                ForEach(plan.exercises, id: \.id) { exercise in
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                        Text("Reps: \(exercise.reps) | Sets: \(exercise.sets)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }

            VStack {
                TextField("Exercise name", text: $newExerciseName)
                TextField("Reps", text: $reps)
                    .keyboardType(.numberPad)
                TextField("Sets", text: $sets)
                    .keyboardType(.numberPad)
                
                Button("Add Exercise") {
                    guard let r = Int(reps), let s = Int(sets) else { return }
                    let newExercise = WorkoutExercise(name: newExerciseName, reps: r, sets: s)
                    plan.exercises.append(newExercise)
                    newExerciseName = ""
                    reps = ""
                    sets = ""
                }
            }
            .padding()
        }
        .navigationTitle(plan.title)
    }
}

