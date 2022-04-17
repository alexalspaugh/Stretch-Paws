//
//  DetailView.swift
//  Stretch+Paws
//
//  Created by Alex Alspaugh on 4/17/22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            Color("Secondary").ignoresSafeArea()
            Text("Purfect")
                .font(.title)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
