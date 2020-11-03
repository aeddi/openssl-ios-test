//
//  ContentView.swift
//  iOS-App
//
//  Created by Antoine Eddi on 11/3/20.
//

import SwiftUI
import Cgo

struct ContentView: View {
    @State var result = ""
    var body: some View {
        VStack {
            Button(action: {
                self.result = "Loading..."
                let startTime = Date.init()
                let testResult = CgoTest("All your base are belong to us")
                let timeElapsed = startTime.timeIntervalSinceNow * -1000
                self.result = "Time elapsed: \(timeElapsed) ms\nResult:\n \(testResult)"

            }) {
                HStack {
                    Image(systemName: "speedometer")
                        .font(.title)
                    Text("Test")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            }
            Text(result)
            .padding(33)
        }
        .padding(.top, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
