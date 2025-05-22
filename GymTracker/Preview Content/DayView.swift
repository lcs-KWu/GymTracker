//
//  DayView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftUI
import SwiftData

struct DayView: View {
    //stored properties
    //Access model
    @Environment(\.modelContext) var modelContext
    @Query var workoutPlans : [WorkoutPlan]
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(workoutPlans) { plan in
                        Text(plan.title)
                    }
                }
            }
            .navigationTitle("Workout Plans")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button("Edit") {
                        //does not do anything
                        
                    }
                }
                ToolbarItem(placement:.primaryAction){
                    Button{
                        addWorkoutDay()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
        .tint(.orange)
    }
    
    // MARK: - Functions
        
        func addWorkoutDay() {
            let newPlan = WorkoutPlan(title: "WorkoutDays", )
            modelContext.insert(newPlan)
        }
        }


    


#Preview {
    DayView()
}
