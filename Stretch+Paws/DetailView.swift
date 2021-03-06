//
//  DetailView.swift
//  Stretch+Paws
//
//  Created by Alex Alspaugh on 4/17/22.
//

import SwiftUI

struct DetailView: View {
    let pose: Pose
    
    @State private var timerOpen = false
    
        var body: some View {
            ZStack {
                Color("Secondary").ignoresSafeArea()
                ScrollView (showsIndicators: false) {
                    
                    VStack (spacing: 32) {
                        
                        VStack (spacing: 16) {
                            
                            Image(pose.icon)
                                .resizable()
                                .frame(width: 200, height: 200)
                            
                            Text(pose.name)
                                .font(.system(size: 36))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Highlight"))
                                .multilineTextAlignment(.center)
                                
                            Text(pose.asana)
                                .font(.system(size: 18))
                                .italic()
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                        }
                        
                        Text(pose.description)
                            
                        VStack (alignment: .leading, spacing: 8) {
                                
                            Text("How to:")
                                .fontWeight(.medium)
                                .foregroundColor(Color("Highlight"))
                            
                            ForEach(pose.steps, id: \.self) {
                                step in
                                Text(step)
                            }
                                
                        }
                            
                        VStack (alignment: .leading, spacing: 8) {
                                
                            Text("Top tip:")
                                .fontWeight(.medium)
                                .foregroundColor(Color("Highlight"))
                                
                            Text(pose.topTip)
                                
                        }
                        
                    } .padding(.horizontal, 24)
                }
                TimerPanelView(timerOpen: $timerOpen)
            } .onTapGesture {
                timerOpen = false
            }
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pose: Pose(
            name: "Downward-Facing Dog",
            asana: "Adho Mukha Shvanasana",
            icon: "Cat-1",
            description:
            "Did someone say dog? Can't we call this a downward-facing cat instead? It's OK ??? this is a friendly dog, it's not interested in chasing cats. In fact, Downward-Facing Dog is the lynchpin of a yoga asana practice: if you're going to befriend with any of these poses, make sure it's this canine classic.",
            steps: ["From a kneeling position, place your hands shoulder-distance apart and spread your fingers.", "Tuck your toes and lift your hips up towards the ceiling so you create an inverted V shape.", "Balance the weight between hands and feet and think about tilting your tailbone up towards the ceiling.","Send your gaze towards your feet and breath!"],
            topTip: "Bend your knees in order to create more length through the spine." ))
    }
}

struct TimerPanelView: View {
    @Binding var timerOpen: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack {
                timerOpen ? AnyView(TimerOpenView()) : AnyView(TimerClosedView())
            }
            .foregroundColor(Color("Secondary"))
            .frame(maxWidth: .infinity, maxHeight: timerOpen ? 400 : 80)
            .background(Color("Highlight"))
            .cornerRadius(8)
        }
        .ignoresSafeArea()
        .onTapGesture {
            timerOpen.toggle()
        }
    }
}

struct TimerOpenView: View {
    var body: some View {
        VStack {
            Text("Hold that pose")
                .fontWeight(.medium)
            Spacer()
            Text("Try staying in this pose for 30 seconds. If you need to come out sooner, that's ok.")
                .multilineTextAlignment(.center)
            Spacer()
            Text("00:30")
                .font(.system(size: 96))
            Spacer()
            Button {
                
            } label: {
                Text("Start the timer")
            }
            .frame(width: 300, height: 50)
            .background(Color("Secondary"))
            .foregroundColor(Color("Primary"))
            .cornerRadius(30)
            
        } .padding(32)
    }
}

struct TimerClosedView: View {
    var body: some View {
        Text("Try it out")
            .fontWeight(.medium)
            .padding(20)
        Spacer()
    }
}
