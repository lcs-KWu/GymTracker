//
//  PlanView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftUI
import SwiftData

struct ExerciseListView: View {

    // MARK: Stored Properties
    @Environment(\.modelContext) private var context
    @Bindable var plan: WorkoutPlan
    
    @State private var newExerciseName = ""
    @State private var newExerciseReps = ""
    @State private var newExerciseSets = ""

    // MARK: View
    var body: some View {
        VStack(spacing: 0) {

            // Top bar
            HStack {
                Text("Exercises")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    addExercise()
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.cyan)
                        .font(.title2)
                }
            }
            .padding()
            .background(Color.black)

            // Exercise list
            List {
                ForEach(plan.exercises) { exercise in
                    HStack {
                        Text("\(exercise.name) - \(exercise.sets)x\(exercise.reps)")
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        Spacer()
                        Button {
                            deleteExercise(exercise)
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .background(Color.black)

            // Input section
            VStack(spacing: 12) {
                TextField("Exercise Name", text: $newExerciseName)
                    .textFieldStyle(.roundedBorder)
                TextField("Reps", text: $newExerciseReps)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                TextField("Sets", text: $newExerciseSets)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                
                Button("Add Exercise") {
                    addExercise()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            
            // Bottom nav bar
            HStack {
                Spacer()
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "clock.fill")
                Spacer()
                Image(systemName: "arrow.left.and.right.circle.fill")
                Spacer()
            }
            .padding()
            .background(Color.white)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle(plan.title)
    }

    // MARK: Functions

    func addExercise() {
        guard let reps = Int(newExerciseReps),
              let sets = Int(newExerciseSets),
              !newExerciseName.isEmpty else { return }

        let exercise = WorkoutExercise(name: newExerciseName, reps: reps, sets: sets)
        plan.exercises.append(exercise)
        context.insert(exercise)

        newExerciseName = ""
        newExerciseReps = ""
        newExerciseSets = ""
    }

    func deleteExercise(_ exercise: WorkoutExercise) {
        if let index = plan.exercises.firstIndex(of: exercise) {
            plan.exercises.remove(at: index)
            context.delete(exercise)
        }
    }
}
