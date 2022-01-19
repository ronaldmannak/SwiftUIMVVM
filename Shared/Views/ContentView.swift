//
//  ContentView.swift
//  Shared
//
//  Created by Ronald Mannak on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var client = Client()
    
    var body: some View {
        
        TabView {
            
            EditView()
                .environmentObject(client)
                .tabItem {
                    Label("Edit", systemImage: "pencil.circle")
                }
            
            ObservedView(client: client)
                .tabItem {
                    Label("Observed", systemImage: "eyes")
                }
            StateObjectView()
                .environmentObject(client)
                .tabItem {
                    Label("State Object", systemImage: "shippingbox")
                }
            Tab3View()
                .tabItem {
                    Label("Tab 3", systemImage: "3.square")
                }
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
