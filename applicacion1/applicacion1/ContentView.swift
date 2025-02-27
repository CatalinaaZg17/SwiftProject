//
//  ContentView.swift
//  applicacion1
//
//  Created by Catalina Zavala on 19/02/25.
//


import SwiftUI
import MapKit
import PhotosUI

// Modelo de datos
struct LocationItem: Identifiable {
    let id = UUID()
    let country: String
    let coordinate:CLLocationCoordinate2D
    let image: UIImage
}

// ViewModel
class LocationViewModel: ObservableObject {
    @Published var locations: [LocationItem] = []
    
    func addLocation(country: String, coordinate: CLLocationCoordinate2D, image: UIImage) {
        let newItem = LocationItem(country: country, coordinate: coordinate, image: image)
        locations.append(newItem)
    }
    func removeLocation(id: UUID) {
        locations.removeAll { $0.id == id }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = LocationViewModel()
    @State private var showAddLocation = false
    
    var body: some View {
        NavigationView {
            VStack {
                MapView(locations: viewModel.locations)
                    .frame(height: 300)
                
                LocationListView(viewModel: viewModel)
 
            }
            .navigationTitle("Lugares Guardados")
            .toolbar {
                Button("+") {
                    showAddLocation.toggle()
                }
            }
            .sheet(isPresented: $showAddLocation) {
            AddLocationView(viewModel: viewModel, showAddLocation: $showAddLocation)
            }
            }
        }
    }

