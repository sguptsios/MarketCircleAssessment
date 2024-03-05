//
//  ContentView.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var menuOpen: Bool = false
    @StateObject var viewModel = ContentViewModel(dataManager: DataManager())
    @State private var presentingAlert: Bool = false
    
    var body: some View {
        ZStack {
            if !self.menuOpen {
                VStack(spacing: 50) {
                    if let data = viewModel.selectedItem {
                        InfoView(name: "\(data.info.title)\(data.name)", age: "\(data.info.age)", email: data.info.email,
                                 phone: data.info.phone)
                    }
                    Button(action: {
                        self.openMenu()
                    }, label: {
                        Text("Menu")
                    })
                }
            }
            
            SideMenu(width: 270,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu, seletcedItem: self.seletedItem(item:),
                     data: viewModel.data)
        }
        .onAppear(perform: {
            viewModel.getData()
            self.presentingAlert = viewModel.presentingAlert
        })
        .alert(viewModel.error.message, isPresented: $presentingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
    
    func seletedItem(item: MyData) {
        self.menuOpen.toggle()
        viewModel.selectedItem = item
    }
    
}

#Preview {
    ContentView()
}
