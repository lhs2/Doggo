//
//  OptionsMenuViewController.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import UIKit

protocol OptionsMenuViewControllerLogic: AnyObject {
    func filter(isAsc: Bool, isGrid: Bool)
}

final class OptionsMenuViewController: UIViewController {
    
    private let popupView = OptionsMenuView()
    weak var delegate: OptionsMenuViewControllerLogic?
    
    init(isAsc: Bool, isGrid: Bool) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        
        popupView.setupViewWith(isAsc: isAsc, isGrid: isGrid)
        popupView.filterButton.addTarget(self, action: #selector(changeToOptions), for: .touchUpInside)
        popupView.closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError(Text.coderNotImplemented)
    }
    
    override func loadView() {
        view = popupView
    }
    
    @objc func changeToOptions() {
        let isAscOrder = popupView.isAscOrder()
        let isGridMode = popupView.isGridModeChecked()
        delegate?.filter(isAsc: isAscOrder, isGrid: isGridMode)
        dismissView()
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }

}

