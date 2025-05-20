//
//  PlanView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftUI

struct PlanView: View {
    var body: some View {
        NavigationStack {
            VStack{
              Text("code")
            }
            .navigationTitle("Workout Schedule")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button("Edit") {
                        //does not do anything
                        
                    }
                }
                ToolbarItem(placement:.primaryAction){
                    Button{
                        //doent do anything
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
        }
    }
            
        }

#Preview {
    PlanView()
}
