//
//  ContentView.swift
//  CombineRegisterDemoProject
//
//  Created by 黃建程 on 2022/2/11.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var userRegistrationViewModel = UserRegistrationViewModel()

    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)

            FormTextFieldView(fieldName: "Username", fieldValue: $userRegistrationViewModel.username)
            NeedText(iconColor: userRegistrationViewModel.isUsernameLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                     text: "A minimum of 4 characters",
                     isStrikeThrough: userRegistrationViewModel.isUsernameLengthValid)
                .padding()

            FormTextFieldView(fieldName: "Password", fieldValue: $userRegistrationViewModel.password, isSecure: true)
            VStack {
                NeedText(iconName: "lock.open",
                         iconColor: userRegistrationViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                         text: "A minimum of 8 characters",
                         isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid)
                NeedText(iconName: "lock.open",
                         iconColor: userRegistrationViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                         text: "One uppercase letter",
                         isStrikeThrough: userRegistrationViewModel.isPasswordCapitalLetter)
            }
            .padding()

            FormTextFieldView(fieldName: "Confirm Password",
                              fieldValue: $userRegistrationViewModel.passwordConfirm,
                              isSecure: true)
            NeedText(iconColor: userRegistrationViewModel.isPasswordConfirmValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                     text: "Your confirm password should be the same as password",
                     isStrikeThrough: userRegistrationViewModel.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 50)

            Button(action: {
                // Proceed to the next screen
            }) {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()

                Button(action: {
                    // Proceed to Sign in screen
                }) {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }.padding(.top, 50)

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
