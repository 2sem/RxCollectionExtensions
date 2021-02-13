//
//  Rx+CollectionObservable.swift
//  RxCollectionExtensions_Tests
//
//  Created by 영준 이 on 2021/02/11.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension Observable where Element: Sequence{
    public typealias ElementType = Element.Iterator.Element;
    //func bindTable<Cell>(to: UITableView, cellIdentifier: String, cellType: Cell.Type, cellGenerator:  @escaping (UITableView, ElementType, Cell) -> Disposable){
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
        let value = disposeBag ?? DisposeBag();
        self.bind(to: to.rx.items(cellIdentifier: cellIdentifier, cellType: CollectionCell.self)){ (index, row, cell) in
            cellConfigurator(index, row, cell);
        }.disposed(by: value);
        
        return value;
    }
    
    @discardableResult
    //TableCell
    public func bind<TableCell>(toTableView to: UITableView, cellIdentifier: String, cellType: TableCell.Type, disposeBag: DisposeBag? = nil, cellConfigurator:  @escaping (_ cellRow: Int, _ element: ElementType, TableCell) -> Void) -> DisposeBag where TableCell: UITableViewCell{ //, cellType: Cell.Type
        let value = disposeBag ?? DisposeBag();
        self.bind(to: to.rx.items(cellIdentifier: cellIdentifier, cellType: TableCell.self)){ (index, row, cell) in
            cellConfigurator(index, row, cell);
        }.disposed(by: value);
        
        return value;
    }
    
    public var siva : Int{
        return 0;
    }
}
