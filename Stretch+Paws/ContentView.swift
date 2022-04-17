//
//  ContentView.swift
//  Stretch+Paws
//
//  Created by Alex Alspaugh on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DetailView()) {
                    Text("Downward-facing Dog")
                }
                Text("Standing Foward Fold")
                Text("Tree Pose")
            }   .listStyle(.grouped)
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
