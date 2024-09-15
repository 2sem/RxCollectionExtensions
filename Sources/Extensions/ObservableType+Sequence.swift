//
//  ObservableType+Sequence.swift
//  ExampleApp
//
//  Created by 영준 이 on 2021/02/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension ObservableType where Element: Sequence{
    typealias ElementType = Element.Iterator.Element;
    /**
     support completion for binding obervable sequence to tableView.rx.items
     
     - parameter cellIdentifier: Identifier used to dequeue cells.
     - parameter cellType: Type of table view cell.
     - parameter cellGernerator: configurator table view cell.
     - parameter cellRow: Row index of table view cell.
     - parameter element: element of sequence.
     - parameter cell: generated table view cell.
     - returns: generated disposeBag.
     
     Example:
         let items = Observable.just([
             "First Item",
             "Second Item",
             "Third Item"
         ])
         
         items
         .bindTable(to: tableView, cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
            cell.textLabel?.text = "\(element) @ row \(row)"
         }
         .disposed(by: disposeBag)
     */
    @discardableResult
    func bind<CollectionCell>(toCollectionView to: UICollectionView, cellIdentifier: String, cellType: CollectionCell.Type, disposeBag: DisposeBag? = nil
        , cellConfigurator:  @escaping (_ cellRow: Int, _ element: ElementType, CollectionCell) -> Void) -> DisposeBag where CollectionCell: UICollectionViewCell{ //, cellType: Cell.Type
        
        return self.asObservable().bind(toCollectionView: to, cellIdentifier: cellIdentifier, cellType: cellType, disposeBag: disposeBag, cellConfigurator: cellConfigurator)
    }
    
    @discardableResult
    //TableCell
    func bind<TableCell>(toTableView to: UITableView, cellIdentifier: String, cellType: TableCell.Type, disposeBag: DisposeBag? = nil, cellConfigurator:  @escaping (_ cellRow: Int, _ element: ElementType, TableCell) -> Void) -> DisposeBag where TableCell: UITableViewCell{ //, cellType: Cell.Type
        return self.asObservable().bind(toTableView: to, cellIdentifier: cellIdentifier, cellType: cellType, disposeBag: disposeBag, cellConfigurator: cellConfigurator)
    }
}
