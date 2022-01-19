//
//  NoSpacesViewController.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import Foundation
import UIKit

class NoSpacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var plainJaneTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setBackground()
        plainJaneTable.register(UINib(nibName: "NoSpaceTableViewCell", bundle: nil), forCellReuseIdentifier: "NoSpaceTableViewCell")
        plainJaneTable.register(UINib(nibName: "NoSpaceDoubleTableViewCell", bundle: nil), forCellReuseIdentifier: "NoSpaceDoubleTableViewCell")
        plainJaneTable.register(UINib(nibName: "NoSpaceTallTableViewCell", bundle: nil), forCellReuseIdentifier: "NoSpaceTallTableViewCell")
        
        plainJaneTable.dataSource = self
        plainJaneTable.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = UIColor.QuickAndEasy.lightGray
    }
    
    func setBackground() {
        let bgImage = UIImage(named: "circle-scatter")
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = bgImage
        bgImageView.contentMode = .scaleToFill
        
        self.view.insertSubview(bgImageView, at: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch Int.random(in: 0...9) {
        case 0...3: cell = tableView.dequeueReusableCell(withIdentifier: "NoSpaceTableViewCell", for: indexPath) as? NoSpaceTableViewCell ?? UINib(nibName: "NoSpaceTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NoSpaceTableViewCell
            break
        case 4...7: cell = tableView.dequeueReusableCell(withIdentifier: "NoSpaceDoubleTableViewCell", for: indexPath) as? NoSpaceDoubleTableViewCell ?? UINib(nibName: "NoSpaceDoubleTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NoSpaceDoubleTableViewCell
            break
        case 8...9: cell = tableView.dequeueReusableCell(withIdentifier: "NoSpaceTallTableViewCell", for: indexPath) as? NoSpaceTallTableViewCell ?? UINib(nibName: "NoSpaceTallTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NoSpaceTallTableViewCell
            break
        default:
            cell = UITableViewCell()
            break
        }
        
        return cell
    }
}
