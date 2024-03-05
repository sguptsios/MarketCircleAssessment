//
//  InfoView.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 05/03/24.
//

import SwiftUI

struct InfoView: View {
    var name: String
    var age: String
    var email: String
    var phone: String
    
    var body: some View {
        VStack(spacing: 10){
            Text("Name: \(name)")
            Text("Age: \(age) year old")
            Text("Email: \(email)")
            Text("Phone: \(phone)")
        }
    }
}

#Preview {
    InfoView(name: "",
             age: "",
             email: "",
             phone: "")
}
