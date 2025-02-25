//
//  MapView.swift
//  applicacion1
//
//  Created by Oz bibriesca on 2/24/25.
//

import SwiftUI
import MapKit
import PhotosUI

struct MapView: View {
    var locations: [LocationItem]
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 20.0, longitude: 0.0),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapMarker(coordinate: location.coordinate, tint: .blue)
        }
    }
}
