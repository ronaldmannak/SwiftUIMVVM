//
//  Tab2View.swift
//  SwiftUIMVVM
//
//  Created by Ronald Mannak on 1/18/22.
//

import SwiftUI

struct StateObjectView: View {
    
    @EnvironmentObject var client: Client
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Form {
            Text("ViewModel as StateObject").font(.title)
            Text("The viewModel instance will be kept and reused when a view is redrawn.")
        }
    }
    
    @MainActor
    class ViewModel: ObservableObject {
        
        func update() async {
            
        }
    }
}

struct StateObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}

// can we pass the view model to the view?
