//
//  SectionRowsRepresentable.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
protocol SectionRowsRepresentable {
    var rows: [CellIdentifiable] { get set }
}
