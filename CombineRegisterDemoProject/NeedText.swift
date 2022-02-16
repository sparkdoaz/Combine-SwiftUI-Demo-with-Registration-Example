//
//  NeedText.swift
//  CombineRegisterDemoProject
//
//  Created by 黃建程 on 2022/2/14.
//

import SwiftUI

struct NeedText: View {

    var iconName = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)

    var text = ""
    var isStrikeThrough = false

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}

struct NeedText_Previews: PreviewProvider {
    static var previews: some View {
        NeedText(iconName: "xmark.square", iconColor: Color(red: 251/255, green: 128/255, blue: 128/255), text: "YesMan", isStrikeThrough: false)
    }
}
