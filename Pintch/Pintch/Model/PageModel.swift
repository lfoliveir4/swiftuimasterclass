//
//  PageModel.swift
//  Pintch
//
//  Created by Luis Filipe Alves de Oliveira on 17/05/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + imageName
    }
}
