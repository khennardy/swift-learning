import UIKit

// day 27: swift UI to create views //

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
            
            Text("Welcome, Harumichi!")
                .font(.title)
                .foregroundColor(.green)
            
            Text("Lets build something great together!")
                .font(.subheadline)
                .italic()
        }
        .padding()
    }
}

Preview {
    ContentView()
}
