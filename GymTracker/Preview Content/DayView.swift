//
//  DayView.swift
//  GymTracker
//
//  Created by Yixuan Wu on 2025-05-20.
//

import SwiftUI

struct DayView: View {
    var body: some View {
        NavigationStack {
            VStack{
              //code
                Text("code")
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
    DayView()
}
