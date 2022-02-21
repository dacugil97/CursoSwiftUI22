//
//  CatalogModelView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import Foundation
import SwiftUI

class CatalogModelView {
    var products: [ProductModelView] = []
    
    init(modelServer: CatalogModelServer?) {
        
        guard let modelServer = modelServer,
        let products = modelServer.products else {
            return
        }
        
        self.products = products.map({ProductModelView(modelServer: $0)})
    }
}

class ProductModelView: Identifiable {
    
    var id = UUID()
    var name: String = ""
    var price: Int = 0
    var description: String = ""
    var category: ProductCategory?
    var image: String = ""
    var isInCart: Bool = false
    var cantityInCart: Int = 0
    
    init(modelServer: ProductModelServer?) {
        
        guard let modelServer = modelServer else { return }
        
        self.name = modelServer.name ?? ""
        self.price = modelServer.price ?? 0
        self.description = modelServer.description ?? ""
        self.category = ProductCategory(rawValue: modelServer.category ?? "iphone")
        self.image = modelServer.image ?? ""
    }
}

enum ProductCategory: String {
    case iphone = "iphone"
    case mac = "mac"
    case ipad = "ipad"
    
    func getBackgroundColor() -> Color {
        switch self {
        case .iphone:
            return .pink
        case .ipad:
            return .mint
        default:
            return .indigo
        }
    }
}
