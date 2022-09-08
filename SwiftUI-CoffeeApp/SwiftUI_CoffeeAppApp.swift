//
//  SwiftUI_CoffeeAppApp.swift
//  SwiftUI-CoffeeApp
//
//  Created by Reşat Kut on 4.09.2022.
//

import SwiftUI

@main
struct SwiftUI_CoffeeAppApp: App {
    
    @State var webService = Webservice()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(webService)
        }
    }
}
