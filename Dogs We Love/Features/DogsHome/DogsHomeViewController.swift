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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
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
        title = "Dogs We Love"
        tableView.backgroundColor = UIColor.app(color: .white)
        view.backgroundColor = UIColor.app(color: .white)
    }
    
    private func setupOutputBindings() {
        
        viewModel
            .outputs
            .components
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (dogComponents) in
                
            }).disposed(by: disposeBag)
        
        viewModel
            .outputs
            .isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (isLoading) in
                
            }).disposed(by: disposeBag)
    }
}
