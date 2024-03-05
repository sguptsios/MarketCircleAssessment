//
//  ContentViewModel.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 05/03/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    // Private Properties
    private let dataManager: DataManager
    
    // Public Published Properties
    @Published var data: [MyData]?
    @Published var selectedItem: MyData?
    @Published var error: DataManagerError = .none
    @Published var presentingAlert = false
    
    /// inilization
    /// - Parameter dataManager: `DataManager`
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    
    /// Get data from josn file
    func getData() {
        DataManager().getData { result in
            switch result {
            case .success(let data):
                self.data = data
                self.selectedItem = data.first
            case .failure(let error):
                self.error = error
                self.presentingAlert = true
            }
        }
    }
    
    
}
