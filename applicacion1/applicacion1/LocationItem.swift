//
//  LocationItem.swift
//  applicacion1
//
//  Created by Catalina Zavala on 24/02/25.
//

import SwiftUI
import MapKit
import PhotosUI

// Vista de la lista de ubicaciones
// Vista de la lista de ubicaciones
struct LocationListView: View {
    @ObservedObject var viewModel: LocationViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                HStack {
                    Image(uiImage: location.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text(location.country)
                    Spacer()
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    viewModel.removeLocation(id: viewModel.locations[index].id)
                }
            }
        }
    }
}
