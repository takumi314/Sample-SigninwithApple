//
//  ContentView.swift
//  Sample-SigninwithApple
//
//  Created by NishiokaKohei on 28/09/2019.
//  Copyright © 2019 Takumi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)

            VStack {
                Image("sample_car")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .padding()
                // TextFields for filling User and Password
                UserAndPassword()
                    .padding()
                // Add Sign in with Apple UI View here
                SignInWithApple()
                    .frame(width: 280, height: 60)
            }

        }
        .onAppear()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
