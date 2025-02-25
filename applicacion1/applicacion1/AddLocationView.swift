//
//  AddLocationView.swift
//  applicacion1
//
//  Created by Oz bibriesca on 2/24/25.
//

import SwiftUI
import MapKit
import PhotosUI

// Vista para agregar una ubicación
struct AddLocationView: View {
    @ObservedObject var viewModel: LocationViewModel
    @State private var country = ""
    @State private var selectedImage: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var location = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @State private var showingMapPicker = false
    @Binding var showAddLocation: Bool  // <-- Agregado para cerrar la vista
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("País")) {
                    TextField("Ingrese el país", text: $country)
                }
                
                Section(header: Text("Imagen")) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                    Button("Seleccionar Imagen") {
                        showingImagePicker = true
                        
                    }
                }
                
                Section(header: Text("Ubicación")) {
                    Button("Seleccionar Ubicación") {
                        showingMapPicker = true
                    }
                    Text("Lat: \(location.latitude), Lon: \(location.longitude)")
                }
            }
            .navigationTitle("Agregar Lugar")
            .toolbar {
                Button("Guardar") {
                    if let image = selectedImage {
                        viewModel.addLocation(country: country, coordinate: location, image: image)
                        showAddLocation = false // Cierra la vista después de guardar
                    }
                    if let image = selectedImage {
                        viewModel.addLocation(country: country, coordinate: location, image: image)
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .sheet(isPresented: $showingMapPicker) {
                LocationPicker(location: $location)
            }
        }
    }
    
    func loadImage() {
        if let inputImage = inputImage {
            selectedImage = inputImage
        }
    }
}
