//
//  FormTextFieldView.swift
//  CombineRegisterDemoProject
//
//  Created by 黃建程 on 2022/2/14.
//

import SwiftUI

struct FormTextFieldView: View {
    var fieldName = ""
    @Binding var fieldValue: String

    var isSecure = false

    var body: some View {

        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)

            } else {
                TextField(fieldName, text: $fieldValue)                 .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }

            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)

        }
    }
}

struct FormTextFieldView_Previews: PreviewProvider {

    struct FormTextFieldViewDemo: View {
        @State private var valueText: String = "account"
        var body: some View {
            FormTextFieldView(fieldName: "Account", fieldValue: $valueText, isSecure: false)
        }
    }

    static var previews: some View {
        FormTextFieldViewDemo()
    }
}

