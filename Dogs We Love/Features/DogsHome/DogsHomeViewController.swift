//
//  DogsHomeViewController.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public final class DogsHomeViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: DogHomeTableViewCell.self)
            tableView.contentInset = UIEdgeInsets(top: 33, left: 0, bottom: 0, right: 0)
            tableView.dataSource = dataSource
            tableView.tableFooterView = UIView()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    
    private let disposeBag = DisposeBag()
    private let viewModel: DogsHomeViewModelType
    private let coordinator: DogsHomeCoordinatorType
    
    private lazy var dataSource = makeDataSource()
    
    public init(viewModel: DogsHomeViewModelType,
                coordinator: DogsHomeCoordinatorType) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: DogsHomeViewController.typeName, bundle: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupOutputBindings()
    }
    
    // MARK: Setup
    
    private func setupView() {
        title = "dogsWeLove.title".localized
        tableView.backgroundColor = UIColor.app(color: .white)
        view.backgroundColor = UIColor.app(color: .white)
    }
    
    private func setupOutputBindings() {
        
        viewModel
            .outputs
            .components
            .observeOn(MainScheduler.instance)
            .debounce(0.5, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (dogComponents) in
                self?.update(with: dogComponents)
            }).disposed(by: disposeBag)
        
        viewModel
            .outputs
            .isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (isLoading) in
                
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
                
            }).disposed(by: disposeBag)
    }
}

private extension DogsHomeViewController {
    
    enum Section: CaseIterable {
        case dogs
    }
    
    func makeDataSource() -> UITableViewDiffableDataSource<Section, DogsHomeComponent> {
        
        return UITableViewDiffableDataSource(tableView: tableView, cellProvider: {  tableView, indexPath, component in
            
            switch component {
            case .info(let dog):
                let cell = tableView.dequeueReusableCell(with: DogHomeTableViewCell.self, for: indexPath)
                cell.configure(viewData: dog)
                return cell
            }
        })
    }
    
    func update(with list: [DogsHomeComponent], animate: Bool = true) {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, DogsHomeComponent>()
        snapshot.appendSections([Section.dogs])
        snapshot.appendItems(list, toSection: .dogs)

        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
    
