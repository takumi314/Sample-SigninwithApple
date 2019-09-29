//
//  ContentView.swift
//  Sample-SigninwithApple
//
//  Created by NishiokaKohei on 28/09/2019.
//  Copyright © 2019 Takumi. All rights reserved.
//

import SwiftUI
import AuthenticationServices

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
                    .onTapGesture(perform: showAppleLogin)
            }

        }
        .onAppear()
    }
}

extension ContentView {

    private func showAppleLogin() {
        // 1. All sign in requests need an ASAuthorizationAppleIDRequest.
        let request = ASAuthorizationAppleIDProvider().createRequest()

        // 2. Specify the type of end user data you need to know.
        request.requestedScopes = [.fullName, .email]

        // 3. Generate the controller which will display the sign in dialog.
        let controller = ASAuthorizationController(authorizationRequests: [request])
    }

}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
