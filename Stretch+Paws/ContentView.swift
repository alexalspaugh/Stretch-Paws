//
//  ContentView.swift
//  Stretch+Paws
//
//  Created by Alex Alspaugh on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor =
            UIColor(named: "Secondary")
    }
    
    let poses = Poses()
    var body: some View {
        NavigationView {
            List (poses.poseData) { pose in
                NavigationLink(destination: DetailView(pose: pose)) {
                    Image(pose.icon)
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text(pose.name)
                        .fontWeight(.medium)
                        .font(.title3)
                        .padding(.leading, 20)
                }
                .padding(5)
                .listRowBackground(Color("Secondary"))
            }
                .listStyle(.grouped)
                .navigationTitle("Stretch + Paws")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
