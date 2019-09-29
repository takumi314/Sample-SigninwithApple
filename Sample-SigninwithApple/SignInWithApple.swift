//
//  SignInWithApple.swift
//  Sample-SigninwithApple
//
//  Created by NishiokaKohei on 29/09/2019.
//  Copyright © 2019 Takumi. All rights reserved.
//

import SwiftUI
import AuthenticationServices

// 1. You subclass UIViewRepresentable when you need to wrap a UIView.
final class SignInWithApple: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    typealias Context = UIViewRepresentableContext<SignInWithApple>

    // 2. `makeUIView` should always return a specific type of UIView.
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        // 3. Since you’re not performing any customization,
        // you return the Sign In with Apple object directly.
        return ASAuthorizationAppleIDButton()
    }
    // 4. Since the view’s state never changes, leave an empty implementation.
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }

}
