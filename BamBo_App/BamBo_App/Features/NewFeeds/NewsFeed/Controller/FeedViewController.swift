//
//  FeedViewController.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/20/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit
import IGListKit
import SwiftyJSON

class FeedViewController: BaseViewController {

    // MARK: - Variables
    
    private lazy var adapter: ListAdapter = {
        let updater  = ListAdapterUpdater()
        let adapter  = ListAdapter(updater: updater,
                                   viewController: self,
                                   workingRangeSize: 5)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        return adapter
    }()
    
    private var dataSource: [BaseFeedSectionModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing      = 4
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.frame = view.bounds
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NewFeeds"
        self.requestAPINewsFeed()
        view.addSubview(collectionView)
    }

    private func requestAPINewsFeed() {
        dataSource.append(PostFeedSectionModel())
        adapter.reloadData(completion: nil)
    }
}

 // MARK: - ListAdapterDataSource
 
extension FeedViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return dataSource
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return PostFeedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
