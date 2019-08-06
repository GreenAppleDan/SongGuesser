//
//  FoundSongsFoundSongsPresenter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class FoundSongsPresenter: FoundSongsPresenterProtocol , SongSectionModelDelegate , LyricsViewDelegate  {
    
    
    var sections = [SongSectionModel]()
    
    weak var view: FoundSongsViewProtocol!
    var interactor: FoundSongsInteractorProtocol!
    var router: FoundSongsRouterProtocol!
    
    required init(view: FoundSongsViewProtocol) {
        self.view = view
    }
    
    // MARK: - FoundSongsPresenterProtocol methods
    
    func configureView() {
        
        for song in (view?.arrayOfSongs ?? [Song]()) {
            let section = SongSectionModel(song)
            section.delegate = self
            
            sections.append(section)
        }
        view.updateForSections(sections)
    }
    
    func didTapGetLyrics(withLyrics lyrics: String , withTitle: String) {
        view.lyricsView.labelWithTitle.text = withTitle
        view.lyricsView.labelWithLyrics.text = lyrics
        view.showLyricsView()
    }
    
    
    func backButtonClicked() {
        router.moveToSongFinder()
    }
    
    func closeButtonClickedLyricsSubView() {
        view.hideLyricsView()
    }
    
    func tableViewTapped(index: Int){
        let songToProcess = view.arrayOfSongs![index]
        view.lyricsForSongInfo = songToProcess.lyrics
        view.titleForSongInfo = songToProcess.fullTitle
        
        view.modelsForSongInfo = GetCellModelsFromSong.shared.getCellModelsFromSong(song: songToProcess)
        router.moveToSongInfo()
    }
}
//    func setupSongInfoViewAndShow(index: Int){
//        var songToProcess = view.arrayOfSongs![index]
//        view.songInfoView.lyrics = songToProcess.lyrics
//        view.songInfoView.title = songToProcess.fullTitle
//        var arrayOfModels = [LinkInfoCellModel]()
//        if let youtubeUrl = songToProcess.utubeLink{
//        arrayOfModels.append(LinkInfoCellModel(url: youtubeUrl, urlType: .youTube))
//        }
//        if let spotifyUrl = songToProcess.spotifyLink{
//            arrayOfModels.append(LinkInfoCellModel(url: spotifyUrl, urlType: .spotify))
//        }
//        if let appleMusicUrl = songToProcess.appleMusicLink{
//            arrayOfModels.append(LinkInfoCellModel(url: appleMusicUrl, urlType: .appleMusic))
//        }
//        view.songInfoView.reloadTableView()
//        view.showSongInfoView()
//    }


//func employeesDidReceive(_ employees: [Employee]) {
//    var sections = [EmployeeSectionModel]()
//    employees.forEach({
//        let section = EmployeeSectionModel($0)
//        section.delegate = self
//
//        sections.append(section)
//    })
//
//    view.updateForSections(sections)
//}
