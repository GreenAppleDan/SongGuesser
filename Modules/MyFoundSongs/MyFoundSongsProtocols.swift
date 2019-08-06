//
//  MyFoundSongsMyFoundSongsProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol MyFoundSongsViewProtocol: class {
    func updateForSections(_ sections: [SongSectionModel])
    func showLyricsView()
    func hideLyricsView()
    var lyricsView: LyricsView! { get set}
    var arrayOfSongs : [Song]? {get set}
    var lyricsForSongInfo: String? {get set}
    var titleForSongInfo: String? { get set }
    var modelsForSongInfo: [LinkInfoCellModel]? {get set}
}

protocol MyFoundSongsPresenterProtocol: class {
    var router: MyFoundSongsRouterProtocol! { set get }
    func tableViewTapped(index: Int)
    func configureView()
}

protocol MyFoundSongsInteractorProtocol: class {
}

protocol MyFoundSongsRouterProtocol: class {
    func moveToSongInfo()
}

protocol MyFoundSongsConfiguratorProtocol: class {
    func configure(with viewController: MyFoundSongsViewController)
}
