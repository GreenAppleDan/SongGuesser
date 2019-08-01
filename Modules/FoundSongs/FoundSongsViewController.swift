//
//  FoundSongsFoundSongsViewController.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class FoundSongsViewController: UIViewController, FoundSongsViewProtocol  {
    var arrayOfSongs: [Song]?
    var sections = [SongSectionModel]()
    

    @IBOutlet weak var lyricsView: LyricsView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FoundSongsPresenterProtocol!
    let configurator: FoundSongsConfiguratorProtocol = FoundSongsConfigurator()
    
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        presenter.backButtonClicked()
    }
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    func showLyricsView() {
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
        let xPosition = lyricsView.frame.origin.x
        let yPosition = lyricsView.frame.origin.y + self.view.frame.height
        let width = lyricsView.frame.size.width
        let height = lyricsView.frame.size.height
        UIView.animate(withDuration: 0.5){
            self.lyricsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        }
        

    }
//    let xPosition = DynView.frame.origin.x
//    let yPosition = DynView.frame.origin.y - 20 // Slide Up - 20px
//
//    let width = DynView.frame.size.width
//    let height = DynView.frame.size.height
//
//    UIView.animateWithDuration(1.0, animations: {
//    dynView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
//    })
}

extension FoundSongsViewController: UITableViewDelegate , UITableViewDataSource {

    
    
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
}
//extension EmployeeListViewController {
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sections[section].rows.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = sections[indexPath.section].rows[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! EmployeeBaseCell
//        cell.model = model
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(sections[indexPath.section].rows[indexPath.row].cellHeight)
//    }
//}
