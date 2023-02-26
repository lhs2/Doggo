//
//  OptionsMenuView.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import UIKit

final class OptionsMenuView: UIView {
    
    private let popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.textColor = .black
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.text = Text.optionsMenuTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showAsGridCheckbox: UICheckbox = {
        let checkbox = UICheckbox()
        checkbox.backgroundColor = .white
        checkbox.tintColor = .black
        checkbox.contentMode = .scaleAspectFit
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    
    private let showAsGridCheckboxLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = Text.optionsMenuCheckboxLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sortingSegment: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["ASC", "DESC"])
        segmented.selectedSegmentIndex = 0
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = #imageLiteral(resourceName: "close")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.setTitle(Text.optionsMenuConfirmButton, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Text.coderNotImplemented)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        addSubviews()
        updateConstraint()
    }
    
    private func addSubviews() {
        addSubview(popupView)
        popupView.addSubview(title)
        popupView.addSubview(closeButton)
        popupView.addSubview(sortingSegment)
        popupView.addSubview(showAsGridCheckbox)
        popupView.addSubview(showAsGridCheckboxLabel)
        popupView.addSubview(filterButton)
        
    }
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: 48),
            popupView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            
            title.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 40),
            popupView.trailingAnchor.constraint(equalTo: title.trailingAnchor, constant: 40),
            title.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 18),
            
            closeButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -12),
            closeButton.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 12),
            closeButton.leadingAnchor.constraint(greaterThanOrEqualTo: title.trailingAnchor, constant: 2),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.widthAnchor.constraint(equalToConstant: 24),

            
            showAsGridCheckbox.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 22),
            showAsGridCheckbox.heightAnchor.constraint(equalToConstant: 24),
            showAsGridCheckbox.widthAnchor.constraint(equalToConstant: 24),
            showAsGridCheckbox.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            
            showAsGridCheckboxLabel.leadingAnchor.constraint(equalTo: showAsGridCheckbox.trailingAnchor, constant: 12),
            showAsGridCheckboxLabel.heightAnchor.constraint(equalToConstant: 24),
            popupView.trailingAnchor.constraint(equalTo: showAsGridCheckboxLabel.trailingAnchor, constant: 12),
            showAsGridCheckboxLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            
            sortingSegment.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 12),
            sortingSegment.heightAnchor.constraint(equalToConstant: 32),
            popupView.trailingAnchor.constraint(equalTo: sortingSegment.trailingAnchor, constant: 12),
            sortingSegment.topAnchor.constraint(equalTo: showAsGridCheckbox.bottomAnchor, constant: 12),
            sortingSegment.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            
            filterButton.topAnchor.constraint(equalTo: sortingSegment.bottomAnchor, constant: 12),
            filterButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 18),
            filterButton.heightAnchor.constraint(equalToConstant: 40),
            popupView.trailingAnchor.constraint(equalTo: filterButton.trailingAnchor, constant: 18),
            popupView.bottomAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 18)

        ])
    }
    
    func setupViewWith(isAsc: Bool, isGrid: Bool) {
        showAsGridCheckbox.isChecked = isGrid
        sortingSegment.selectedSegmentIndex = isAsc ? 0 : 1
    }
    
    func isAscOrder() -> Bool {
        return sortingSegment.selectedSegmentIndex == 0 ? true : false
    }
    
    func isGridModeChecked() -> Bool {
        return showAsGridCheckbox.isChecked
    }
    
}

