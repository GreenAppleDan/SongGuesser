//
//  MyFoundSongsMyFoundSongsViewController.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class MyFoundSongsViewController: UIViewController, MyFoundSongsViewProtocol {
    
    var arrayOfSongs : [Song]?
    var sections = [SongSectionModel]()
    
    var lyricsForSongInfo: String?
    var titleForSongInfo: String?
    var modelsForSongInfo: [LinkInfoCellModel]?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lyricsView: LyricsView!
    
    var presenter: MyFoundSongsPresenterProtocol!
    let configurator: MyFoundSongsConfiguratorProtocol = MyFoundSongsConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.viewDidAppear(animated)
//        presenter.configureView()
//    }
    
    func showLyricsView() {
        self.tabBarController?.tabBar.isHidden = true
//        self.tabBarController?.tabBar.layer.zPosition = -1
        self.view.bringSubviewToFront(lyricsView)
        let xPosition = lyricsView.frame.origin.x
        let yPosition = CGFloat(0)
        let width = lyricsView.frame.size.width
        let height = lyricsView.frame.size.height
        UIView.animate(withDuration: 0.5){
            self.lyricsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        }
    }
    
    func hideLyricsView() {
        self.tabBarController?.tabBar.isHidden = false
//        self.tabBarController?.tabBar.layer.zPosition = 0
        let xPosition = lyricsView.frame.origin.x
        let yPosition = lyricsView.frame.origin.y + self.view.frame.height
        let width = lyricsView.frame.size.width
        let height = lyricsView.frame.size.height
        UIView.animate(withDuration: 0.5){
            self.lyricsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SongInfoViewController {
            let viewController = segue.destination as? SongInfoViewController
            viewController?.lyrics = lyricsForSongInfo
            viewController?.songTitle = titleForSongInfo
            viewController?.arrayOfModels = modelsForSongInfo
            //            viewController?.arrayOfSongsForFoundSongs = arrayOfSongs
            //            viewController?.sectionsForFoundSongs = sections
        }
    }
    
    
}

extension MyFoundSongsViewController: UITableViewDelegate , UITableViewDataSource {
    func updateForSections(_ sections: [SongSectionModel]) {
        self.sections = sections
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! SongBaseCell
        cell.model = model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(56)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        CloudFirestoreService.shared.addSongToDBCurrentUser(song : arrayOfSongs![indexPath.section])
        presenter.tableViewTapped(index: indexPath.section)
    }
}


