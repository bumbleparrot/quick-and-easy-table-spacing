//
//  SpacesViewController.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import UIKit

class SpacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIContextMenuInteractionDelegate  {
    @IBOutlet weak var plainJaneTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground()
        
        plainJaneTable.register(UINib(nibName: "SingleTableViewCell", bundle: nil), forCellReuseIdentifier: "SingleTableViewCell")
        plainJaneTable.register(UINib(nibName: "DoubleTableViewCell", bundle: nil), forCellReuseIdentifier: "DoubleTableViewCell")
        plainJaneTable.register(UINib(nibName: "TallTableViewCell", bundle: nil), forCellReuseIdentifier: "TallTableViewCell")
        plainJaneTable.register(UINib(nibName: "TripleTableViewCell", bundle: nil), forCellReuseIdentifier: "TripleTableViewCell")
        
        plainJaneTable.separatorStyle = .none
        plainJaneTable.dataSource = self
        plainJaneTable.delegate = self
        plainJaneTable.backgroundColor = .clear
        plainJaneTable.semanticContentAttribute = .forceRightToLeft
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = UIColor.QuickAndEasy.lightGrayTransparent
    }
    
    func setBackground() {
        let bgImage = UIImage(named: "circle-scatter")
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = bgImage
        bgImageView.contentMode = .scaleToFill
        
        self.view.insertSubview(bgImageView, at: 0)
    }
    
    // MARK: UITableView Datasource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch Int.random(in: 0...11) {
        case 0...2: cell = tableView.dequeueReusableCell(withIdentifier: "SingleTableViewCell", for: indexPath) as? SingleTableViewCell ?? UINib(nibName: "SingleTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SingleTableViewCell
            break
        case 3...5: cell = tableView.dequeueReusableCell(withIdentifier: "DoubleTableViewCell", for: indexPath) as? DoubleTableViewCell ?? UINib(nibName: "DoubleTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DoubleTableViewCell
            break
        case 6...8: cell = tableView.dequeueReusableCell(withIdentifier: "TallTableViewCell", for: indexPath) as? TallTableViewCell ?? UINib(nibName: "TallTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TallTableViewCell
            break
        case 9...11: cell = tableView.dequeueReusableCell(withIdentifier: "TripleTableViewCell", for: indexPath) as? TripleTableViewCell ?? UINib(nibName: "TripleTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TripleTableViewCell
            break
        default:
            cell = UITableViewCell()
            break
        }
        
        let interaction = UIContextMenuInteraction(delegate: self)
        
        cell.addInteraction(interaction)
        var cellBgView = UIView(frame: cell.contentView.bounds)
        cellBgView.backgroundColor = .clear
        
        cell.selectedBackgroundView = cellBgView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action1 = UIContextualAction(style: .normal, title: "See More") { (action, view, completion) in
            print("See More!")
        }
        
        let action2 = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            print("Delete!")
        }
        
        return UISwipeActionsConfiguration(actions: [action1, action2])
    }
    
    // MARK: Context Menu Interaction delegate
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
         return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
                let twitterAction = UIAction(title: "Twitter", image: UIImage(named: "twitter")) { _ in
                // do whatever action you want to perform.
                }
                let facebookAction = UIAction(title: "Facebook", image: UIImage(named: "facebook")) { _ in
                // do whatever action you want to perform.
                }
                let shareAction = UIMenu(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), children: [twitterAction, facebookAction])
                let editAction = UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) { _ in
                // do whatever action you want to perform.
                }
                let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                // do whatever action you want to perform.
                }
                return UIMenu(title: "Menu", children: [shareAction, editAction, deleteAction])
           }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let tempView = interaction.view else { return nil } // the view with the context menu interaction
        let highlightedRect = tempView.bounds // the rect of the highlighted portion to show

        // 1
        let previewParameters = UIPreviewParameters()
        previewParameters.visiblePath = tempView.layer.accessibilityPath// path of highlighted portion of view to show, remember you can use UIPreviewParameters.init(textLineRects:) for text
        previewParameters.backgroundColor = .clear

        // 2: Notice that we're passing the whole view in here
        let previewTarget = UIPreviewTarget(container: tempView, center: CGPoint(x: highlightedRect.midX, y: highlightedRect.midY))

        // 3: Notice that we're passing the snapshot view in here - not the whole view
        let snapshot = tempView.resizableSnapshotView(from: highlightedRect, afterScreenUpdates: true, withCapInsets: .zero)!
        return UITargetedPreview(view: snapshot, parameters: previewParameters, target: previewTarget)
    }
}
