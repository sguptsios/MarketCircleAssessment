//
//  SideMenu.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 05/03/24.
//

import SwiftUI

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    let seletcedItem: (MyData) -> Void
    var data: [MyData]?
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent(data: data, menuClose: self.seletedItem(item:))
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
    
    func seletedItem(item: MyData) {
        self.seletcedItem(item)
    }
}


