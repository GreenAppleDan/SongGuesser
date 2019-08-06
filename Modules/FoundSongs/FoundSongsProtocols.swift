//
//  FoundSongsFoundSongsProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol FoundSongsViewProtocol: class {
    var arrayOfSongs: [Song]? {get set}
    var sections: [SongSectionModel] {get set}
    func updateForSections(_ sections: [SongSectionModel])
    var lyricsView: LyricsView! {get set}
    func showLyricsView()
    func hideLyricsView()
    var lyricsForSongInfo: String? {get set}
    var titleForSongInfo: String? {get set}
    var modelsForSongInfo: [LinkInfoCellModel]? {get set}
    
}

protocol FoundSongsPresenterProtocol: class {
    var router: FoundSongsRouterProtocol! { set get }
    func configureView()
    func backButtonClicked()
    func tableViewTapped(index: Int)
}

protocol FoundSongsInteractorProtocol: class {
}

protocol FoundSongsRouterProtocol: class {
    func moveToSongFinder()
    func moveToSongInfo()
}

protocol FoundSongsConfiguratorProtocol: class {
    func configure(with viewController: FoundSongsViewController)
}
