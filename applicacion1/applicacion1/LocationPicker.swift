//
//  LocationPicker.swift
//  applicacion1
//
//  Created by rodrigo on 2/24/25.
//

import SwiftUI
import MapKit
import PhotosUI

// Vista del selector de ubicación
struct LocationPicker: View {
    @Binding var location: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true)
            .onTapGesture { gesture in
                let mapCenter = region.center
                location = mapCenter
            }

    }
}

