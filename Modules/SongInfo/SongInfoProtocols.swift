//
//  SongInfoSongInfoProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 02/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol SongInfoViewProtocol: class {
    func showLyricsView()
    func hideLyricsView()
    var lyricsView: LyricsView! {get set}
}

protocol SongInfoPresenterProtocol: class {
    var router: SongInfoRouterProtocol! { set get }
    func configureView()
    func backButtonClicked()
    func didTapGetLyrics(withLyrics lyrics: String , withTitle: String)

}

protocol SongInfoInteractorProtocol: class {
}

protocol SongInfoRouterProtocol: class {
    func moveToFoundSongs()
}

protocol SongInfoConfiguratorProtocol: class {
    func configure(with viewController: SongInfoViewController)
}
