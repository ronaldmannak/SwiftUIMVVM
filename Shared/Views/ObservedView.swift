//
//  Tab1View.swift
//  SwiftUIMVVM
//
//  Created by Ronald Mannak on 1/18/22.
//

import SwiftUI

struct ObservedView: View {
    
    @ObservedObject var client: Client
    @ObservedObject var viewModel: ViewModel
    
    init(client: Client) {
        self.client = client
        viewModel = ViewModel(client: client)
    }
    
    var body: some View {
        Form {
            Text("ViewModel as ObservedObject").font(.title)
            Text("The viewModel instance is recreated every time a view is redrawn.")
            
        }
    }
    
    @MainActor
    class ViewModel: ObservableObject {
        
        // Setting properties to "none" so we recognize uninitialized values easily
        @Published var asyncValue = "(none)"
        @Published var value = "(none)"
        @Published var delay = "(none)"
        
        let client: Client
                
        init(client: Client) { //async {
            self.client = client
        }
        
    }
}

struct ObservedView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedView(client: Client())
    }
}


