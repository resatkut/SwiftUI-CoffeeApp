//
//  ContentView.swift
//  SwiftUI-CoffeeApp
//
//  Created by Reşat Kut on 4.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var webservice: Webservice
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView{
            List(webservice.coffeeOrders) { order in
                CoffeeOrderCellView(order: order)
                
                .navigationTitle("Coffee Orders")
            }.task {
                try? await webservice.populateCoffeeOrders()
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Order") {
                        isPresented = true
                    }
                }
            }.sheet(isPresented: $isPresented) {
                AddCoffeeOrderView()
            }
            .navigationTitle("Coffee Orders")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView().environmentObject(Webservice())
        
    }
}

struct CoffeeOrderCellView: View {
    
    let order: CoffeeOrder
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.coffeeName)
                Text(order.name)
                    .font(.caption)
                    .opacity(0.8)
            }
            Spacer()
            Text(order.size.rawValue)
                .padding(10)
                .foregroundColor(.white)
                .background {
                    Color.orange
                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        }
    }
}
