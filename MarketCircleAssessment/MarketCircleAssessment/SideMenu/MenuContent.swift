//
//  MenuContent.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 04/03/24.
//

import SwiftUI

struct MenuContent: View {
    
    var data: [MyData]?
    let menuClose: (MyData) -> Void
    
    var body: some View {
        if let data = self.data {
            List(data, id: \.name) { item in
                Button(action: {
                    menuClose(item)
                }, label: {
                    Text("\(item.name)")
                        .foregroundStyle(Color.black)
                })
            }
        } else {
            EmptyView()
        }
    }
}

