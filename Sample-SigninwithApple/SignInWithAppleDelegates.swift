//
//  SignInWithAppleDelegates.swift
//  Sample-SigninwithApple
//
//  Created by NishiokaKohei on 29/09/2019.
//  Copyright © 2019 Takumi. All rights reserved.
//

import UIKit
import AuthenticationServices

final class SignInWithAppleDelegates: NSObject {
    private let signInSucceeded: (Bool) -> Void

    init(onSignedIn: @escaping (Bool) -> Void) {
        self.signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {

    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithError error: Error) {
        // Handle error
    }

    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        // To determine whether the user authenticated via Apple ID or a stored iCloud password.
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            // 1. If you receive details, you know it’s a new registration.
            if case .some = appleIdCredential.email, case .some = appleIdCredential.fullName {
                // 2. Call your registration method once you receive details.
                registerNewAccount(credential: appleIdCredential)
            } else {
                // 3. Call your existing account method if you don’t receive details.
                signInWithExistingAccount(credential: appleIdCredential)
            }
        case let passwordCredential as ASPasswordCredential:
            signInWithUserAndPassword(credential: passwordCredential)
        default:
            break
        }
    }
}

extension SignInWithAppleDelegates {

    private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        // 1. Save the desired details and the Apple-provided user in a struct.
        // 2. Store the details into the iCloud keychain for later use.
        // 3. Make a call to your service and signify to the caller whether registration succeeded or not.
    }

    /// Handling Existing Accounts
    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
        // You *should* have a fully registered account here.  If you get back an error
        // from your server that the account doesn't exist, you can look in the keychain
        // for the credentials and rerun setup

        // if (WebAPI.login(credential.user,
        //                  credential.identityToken,
        //                  credential.authorizationCode)) {
        //   ...
        // }
        self.signInSucceeded(true)
    }

    /// Username and Password
    private func signInWithUserAndPassword(credential: ASPasswordCredential) {
      // if (WebAPI.login(credential.user, credential.password)) {
      //   ...
      // }
      self.signInSucceeded(true)
    }
}
