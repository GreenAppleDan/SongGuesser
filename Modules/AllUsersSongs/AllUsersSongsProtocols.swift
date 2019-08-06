//
//  AllUsersSongsAllUsersSongsProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol AllUsersSongsViewProtocol: class {
    func updateForSections(_ sections: [SongSectionModel])
    func showLyricsView()
    func hideLyricsView()
    var lyricsView: LyricsView! { get set}
    var lyricsForSongInfo: String? {get set}
    var titleForSongInfo: String? { get set}
    var modelsForSongInfo: [LinkInfoCellModel]? { get set}
    var arrayOfSongs : [Song]? { get set}
    var sections : [SongSectionModel] { get set}
}

protocol AllUsersSongsPresenterProtocol: class {
    var router: AllUsersSongsRouterProtocol! { set get }
    func configureView()
    func tableViewTapped(index: Int)
}

protocol AllUsersSongsInteractorProtocol: class {
}

protocol AllUsersSongsRouterProtocol: class {
    func moveToSongInfo()
}

protocol AllUsersSongsConfiguratorProtocol: class {
    func configure(with viewController: AllUsersSongsViewController)
}
