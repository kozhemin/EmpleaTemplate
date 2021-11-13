//
//  EmployeeViewController.swift
//  Emplea
//
//  Created by Егор Кожемин on 07.11.2021.
//

import PureLayout
import UIKit

class EmployeeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let scrollView = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()

    lazy var empleosLabel: UILabel = {
        let label = UILabel().configureForAutoLayout()
        label.autoSetDimension(.width, toSize: 252)
        label.autoSetDimension(.height, toSize: 32)
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.078, green: 0.078, blue: 0.086, alpha: 1)
        label.font = UIFont(name: "Sk-Modernist-Bold", size: 21)
        label.text = "Empleos"

        return label
    }()

    lazy var empleosDescriptionLabel: UILabel = {
        let label = UILabel().configureForAutoLayout()
        label.autoSetDimension(.width, toSize: 144)
        label.autoSetDimension(.height, toSize: 89)
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.467, green: 0.494, blue: 0.565, alpha: 1)
        label.font = UIFont(name: "Sk-Modernist-Regular", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.21

        label.attributedText = NSMutableAttributedString(string: "Una comunidad virtual de vecinas y vecinos que ofrecen y buscan empleo.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return label
    }()

    lazy var reclutadoresLabel: UILabel = {
        let label = UILabel().configureForAutoLayout()
        label.autoSetDimension(.width, toSize: 131)
        label.autoSetDimension(.height, toSize: 17)
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.701, green: 0.695, blue: 0.719, alpha: 1)
        label.font = UIFont(name: "Sk-Modernist-Bold", size: 14)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Reclutadores", attributes: [NSAttributedString.Key.kern: 2])

        return label
    }()

    lazy var rightTopImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "empleosImage")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.width, toSize: 280)
        img.autoSetDimension(.height, toSize: 440)
        return img
    }()

    lazy var searchIconImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "searchIcon")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.width, toSize: 64)
        img.autoSetDimension(.height, toSize: 64)
        return img
    }()

    lazy var employeeTable: UITableView = {
        let table = UITableView().configureForAutoLayout()
        table.autoSetDimension(.width, toSize: self.view.frame.width)
        table.autoSetDimension(.height, toSize: 400) // self.view.frame.height
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(UITableViewCell.self, forCellReuseIdentifier: "EmployeeCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Employee"

        employeeTable.dataSource = self
        employeeTable.delegate = self

        configureView()
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(rightTopImage)
        contentView.addSubview(searchIconImage)
        contentView.addSubview(empleosLabel)
        contentView.addSubview(empleosDescriptionLabel)
        contentView.addSubview(reclutadoresLabel)
        contentView.addSubview(employeeTable)
    }

    private func setupConstraints() {
        let widthInset = 20.0
        scrollView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        scrollView.alwaysBounceVertical = true
//        scrollView.contentInsetAdjustmentBehavior = .never // ignire safeare

        contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        contentView.autoMatch(.width, to: .width, of: view)

        empleosLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        empleosLabel.autoPinEdge(toSuperviewEdge: .left, withInset: widthInset)

        empleosDescriptionLabel.autoPinEdge(.left, to: .left, of: empleosLabel)
        empleosDescriptionLabel.autoPinEdge(.top, to: .bottom, of: empleosLabel, withOffset: 10)

        rightTopImage.autoPinEdge(toSuperviewEdge: .top, withInset: -10)
        rightTopImage.autoPinEdge(toSuperviewEdge: .right)

        reclutadoresLabel.autoPinEdge(toSuperviewEdge: .left, withInset: widthInset)
        reclutadoresLabel.autoPinEdge(.top, to: .bottom, of: rightTopImage, withOffset: 10)

        searchIconImage.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        searchIconImage.autoPinEdge(toSuperviewEdge: .right, withInset: widthInset)

        employeeTable.autoPinEdge(.top, to: .bottom, of: reclutadoresLabel, withOffset: 30)

        employeeTable.autoPinEdge(toSuperviewEdge: .bottom, withInset: 50) // !
    }

    private func configureView() {
        view.backgroundColor = .white
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "home-bg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
}

struct Employee {
    var name: String
    var rating: Double
    var imageName: String
}

private let eployeeData = [
    Employee(name: "Carmen Maria", rating: 4.8, imageName: "people-1"),
    Employee(name: "Maria Ines Amaya", rating: 4.8, imageName: "people-2"),
    Employee(name: "Carmen Maria", rating: 4.8, imageName: "people-3"),
    Employee(name: "Alex Torralba", rating: 4.5, imageName: "people-1"),
    Employee(name: "Maria Ines", rating: 4.5, imageName: "people-2"),
    Employee(name: "Alex", rating: 4.5, imageName: "people-3"),
    Employee(name: "Carmen Maria", rating: 4.8, imageName: "people-1"),
    Employee(name: "Maria Ines Amaya", rating: 4.8, imageName: "people-2"),
    Employee(name: "Carmen Maria", rating: 4.8, imageName: "people-3"),
]

extension EmployeeViewController {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeTable.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        eployeeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath as IndexPath)
        cellConfigure(cell, row: eployeeData[indexPath.row])
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        70
    }

    private func cellConfigure(_ cell: UITableViewCell, row: Employee) {
        cell.backgroundColor = .clear

        let employeeImg = UIImageView().configureForAutoLayout()
        employeeImg.image = UIImage(named: row.imageName)
        employeeImg.contentMode = .scaleAspectFit
        employeeImg.autoSetDimension(.width, toSize: 48)
        employeeImg.autoSetDimension(.height, toSize: 48)

        let employeeNameLabel = UILabel()
        employeeNameLabel.autoSetDimension(.width, toSize: 214)
        employeeNameLabel.autoSetDimension(.height, toSize: 19)
        employeeNameLabel.backgroundColor = .clear
        employeeNameLabel.textColor = UIColor(red: 0.078, green: 0.078, blue: 0.086, alpha: 1)
        employeeNameLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 16)
        employeeNameLabel.text = "Carmen Maria "

        let ratingImg = UIImageView().configureForAutoLayout()
        ratingImg.image = UIImage(named: "starIcon")
        ratingImg.contentMode = .scaleAspectFit
        ratingImg.autoSetDimension(.width, toSize: 12)
        ratingImg.autoSetDimension(.height, toSize: 12)

        let ratingLabel = UILabel()
        ratingLabel.autoSetDimension(.width, toSize: 18)
        ratingLabel.autoSetDimension(.height, toSize: 20)
        ratingLabel.backgroundColor = .clear
        ratingLabel.textColor = UIColor(red: 0.467, green: 0.494, blue: 0.565, alpha: 1)
        ratingLabel.font = UIFont(name: "Poppins-Regular", size: 12)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.11
        ratingLabel.attributedText = NSMutableAttributedString(string: "\(row.rating)", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        let arrowRightImg = UIImageView().configureForAutoLayout()
        arrowRightImg.image = UIImage(named: "arrowRight")
        arrowRightImg.contentMode = .scaleAspectFit
        arrowRightImg.autoSetDimension(.width, toSize: 16)
        arrowRightImg.autoSetDimension(.height, toSize: 13)

        cell.addSubview(employeeImg)
        cell.addSubview(employeeNameLabel)
        cell.addSubview(ratingImg)
        cell.addSubview(ratingLabel)
        cell.addSubview(arrowRightImg)

        employeeImg.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        employeeImg.autoPinEdge(toSuperviewEdge: .left, withInset: 20)

        employeeNameLabel.autoPinEdge(.top, to: .top, of: employeeImg, withOffset: 5)
        employeeNameLabel.autoPinEdge(.left, to: .right, of: employeeImg, withOffset: 20)

        ratingImg.autoPinEdge(.top, to: .bottom, of: employeeNameLabel, withOffset: 5)
        ratingImg.autoPinEdge(.left, to: .right, of: employeeImg, withOffset: 20)

        ratingLabel.autoPinEdge(.left, to: .left, of: ratingImg, withOffset: 15)
        ratingLabel.autoPinEdge(.top, to: .top, of: ratingImg)
        ratingLabel.autoAlignAxis(.horizontal, toSameAxisOf: ratingImg)

        arrowRightImg.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        arrowRightImg.autoAlignAxis(.horizontal, toSameAxisOf: employeeImg)
    }
}
