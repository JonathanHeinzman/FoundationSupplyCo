//
//  ChairARView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 8/26/26.
//

import SwiftUI
import RealityKit

struct ChairARView: View {
    
    var modelName: String
    var realHeight: Measurement<UnitLength>
    var maxTapDistance: Measurement<UnitLength> = .init(value: 3, unit: .meters)
    
    @State private var session = SpatialTrackingSession()
    @State private var pivot = Entity()
    @State private var isPlaced: Bool = false
    @State private var yaw: Float = 0
    @State private var commitedYaw: Float = 0
    @State private var surface = Entity()
    
    var body: some View {
        RealityView { content in
            content.camera = .spatialTracking
            
            let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: [0.2, 0.2]), trackingMode: .once)
            content.entities.append(anchor)
            
            surface.components.set(InputTargetComponent())
            surface.components.set(CollisionComponent(shapes: [.generateBox(width: 8, height: 0.1, depth: 8).offsetBy(translation: [0, -0.005, 0])]))
            
            anchor.addChild(surface)
            
            pivot.isEnabled = false
            anchor.addChild(pivot)
            
            if let model = try? await Entity(named: modelName) {
                pivot.addChild(model)
                
                let measured = model.visualBounds(relativeTo: anchor).extents.y
                let target = Float(realHeight.converted(to: .meters).value)
                
                if measured > 0 {
                    model.scale *= target / measured
                }
                
                let bounds = model.visualBounds(relativeTo: pivot)
                model.position.x -= bounds.center.x
                model.position.y -= bounds.min.y
                model.position.z -= bounds.center.z
                
                let size = model.visualBounds(relativeTo: pivot).extents
                pivot.components.set(InputTargetComponent())
                pivot.components.set(CollisionComponent(shapes: [.generateBox(size: size).offsetBy(translation:[0, size.y / 2, 0])]))
                
            }
        }
        .ignoresSafeArea()
        .gesture(place)
        .simultaneousGesture(spin)
        .task { _ = await session.run(.init(tracking: [.plane]))}
        
    }
    
    private var place: some Gesture {
        SpatialTapGesture()
            .targetedToAnyEntity()
            .onEnded { value in
                guard let spot = value.unproject(\.location, to: .scene),
                      let fromLense = value.unproject(\.location, to: .camera),
                      simd_length(fromLense) <= Float(maxTapDistance.converted(to: .meters).value)
                else { return }
                let floory = surface.position(relativeTo: nil).y
                
                pivot.setPosition([spot.x, floory, spot.z], relativeTo: nil)
                pivot.isEnabled = true
                isPlaced = true
            }
    }
    
    private var spin: some Gesture {
        DragGesture()
            .targetedToEntity(pivot)
            .onChanged { value in
                yaw = commitedYaw + Float(value.translation.width) * 0.01
                pivot.orientation = simd_quatf(angle: yaw, axis: [0, 1, 0])
            }
            .onEnded { _ in
                commitedYaw = yaw
            }
    }
}
