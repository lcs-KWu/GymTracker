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
    @Environment(\.modelContext) private var context
    @State private var viewModel: WorkoutViewModel!

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel != nil {
                    List {
                        ForEach(viewModel.workoutPlans, id: \.id) { plan in
                            Text(plan.title)
                        }
                    }

                    Button("Add") {
                        viewModel.addPlan(title: "New Workout Plan")
                    }
                }
            }
            .onAppear {
                if viewModel == nil {
                    viewModel = WorkoutViewModel(context: context)
                }
                Task {
                    await viewModel.fetchPlans()
                }
            }
        }
    }
}



    


#Preview {
    DayView()
}
