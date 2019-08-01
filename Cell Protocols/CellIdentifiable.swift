//
//  CellIdentifiable.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}
