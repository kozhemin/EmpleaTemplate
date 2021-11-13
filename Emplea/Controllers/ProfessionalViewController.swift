//
//  ProfessionalViewController.swift
//  Emplea
//
//  Created by Егор Кожемин on 07.11.2021.
//

import PureLayout
import UIKit

class ProfessionalViewController: UIViewController {
    let scrollView = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()

    lazy var burgerImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "burger-line")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.width, toSize: 32)
        img.autoSetDimension(.height, toSize: 32)
        return img
    }()

    lazy var bellImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "notification-bell")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.width, toSize: 40)
        img.autoSetDimension(.height, toSize: 40)
        return img
    }()

    lazy var topFiveImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "top-5")
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var topLabelHeader: UILabel = {
        let label = UILabel().configureForAutoLayout()
        label.frame = CGRect(x: 0, y: 0, width: 230, height: 86)
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.078, green: 0.078, blue: 0.086, alpha: 1)
        label.font = UIFont(name: "Sk-Modernist-Bold", size: 36)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Busca\nProfesionales"
        return label
    }()

    lazy var people1Image: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "people-1")
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var people2Image: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "people-2")
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var people3Image: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "people-3")
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var arrowBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.autoSetDimension(.width, toSize: 40)
        btn.autoSetDimension(.height, toSize: 40)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(presentEmployeeController), for: .touchUpInside)
        return btn
    }()

    lazy var yellowRectangle: UIView = {
        let view = UIView().configureForAutoLayout()
        view.autoSetDimension(.width, toSize: 320)
        view.autoSetDimension(.height, toSize: 360)
        view.backgroundColor = UIColor(red: 1, green: 0.973, blue: 0.906, alpha: 0.48)
        view.clip(cornerRadius: 60, borderWidth: 1, borderColor: UIColor(red: 1, green: 0.973, blue: 0.906, alpha: 1).cgColor)

        // TODO: add shadow

        // label
        let empleosLabel = UILabel().configureForAutoLayout()
        empleosLabel.frame = CGRect(x: 0, y: 0, width: 252, height: 32)
        empleosLabel.backgroundColor = .clear
        empleosLabel.textColor = UIColor(red: 1, green: 0.75, blue: 0, alpha: 1)
        empleosLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 21)
        empleosLabel.text = "Empleos"
        view.addSubview(empleosLabel)
        empleosLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        empleosLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)

        // description
        var descriptionTextLabel = UILabel().configureForAutoLayout()
        descriptionTextLabel.frame = CGRect(x: 0, y: 0, width: 255, height: 72)
        descriptionTextLabel.backgroundColor = .clear
        descriptionTextLabel.textColor = UIColor(red: 0.078, green: 0.078, blue: 0.086, alpha: 1)
        descriptionTextLabel.font = UIFont(name: "Sk-Modernist-Regular", size: 18)
        descriptionTextLabel.numberOfLines = 0
        descriptionTextLabel.lineBreakMode = .byWordWrapping

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.21
        descriptionTextLabel.attributedText = NSMutableAttributedString(
            string: "Una comunidad virtual de vecinas y vecinos que ofrecen y buscan empleo.",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        view.addSubview(descriptionTextLabel)

        descriptionTextLabel.autoPinEdge(.top, to: .bottom, of: empleosLabel, withOffset: 10.0)
        descriptionTextLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        descriptionTextLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)

        return view
    }()

    lazy var yellowRectImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "yellowRectImage")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.width, toSize: 265)
        img.autoSetDimension(.height, toSize: 226)
        return img
    }()

    lazy var pinkRectangle: UIView = {
        let view = UIView().configureForAutoLayout()
        view.autoSetDimension(.width, toSize: 320)
        view.autoSetDimension(.height, toSize: 360)
        view.backgroundColor = UIColor(red: 1, green: 0.946, blue: 0.946, alpha: 1)
        view.clip(cornerRadius: 60, borderWidth: 1, borderColor: UIColor(red: 1, green: 0.946, blue: 0.946, alpha: 1).cgColor)

        // label
        let empleosLabel = UILabel().configureForAutoLayout()
        empleosLabel.frame = CGRect(x: 0, y: 0, width: 252, height: 32)
        empleosLabel.backgroundColor = .clear
        empleosLabel.textColor = UIColor(red: 0.979, green: 0.4, blue: 0.4, alpha: 1)
        empleosLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 21)
        empleosLabel.text = "Conectar"
        view.addSubview(empleosLabel)
        empleosLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        empleosLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)

        // description
        var descriptionTextLabel = UILabel().configureForAutoLayout()
        descriptionTextLabel.frame = CGRect(x: 0, y: 0, width: 255, height: 72)
        descriptionTextLabel.backgroundColor = .clear
        descriptionTextLabel.textColor = UIColor(red: 0.078, green: 0.078, blue: 0.086, alpha: 1)
        descriptionTextLabel.font = UIFont(name: "Sk-Modernist-Regular", size: 18)
        descriptionTextLabel.numberOfLines = 0
        descriptionTextLabel.lineBreakMode = .byWordWrapping

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.21
        descriptionTextLabel.attributedText = NSMutableAttributedString(
            string: "Y contrata a miles de profesionales, técnicos y oficios en Peñalolén.",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        view.addSubview(descriptionTextLabel)

        descriptionTextLabel.autoPinEdge(.top, to: .bottom, of: empleosLabel, withOffset: 10.0)
        descriptionTextLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        descriptionTextLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)

        return view
    }()

    lazy var pinkRectImage: UIImageView = {
        let img = UIImageView().configureForAutoLayout()
        img.image = UIImage(named: "pinkRectImage")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.width, toSize: 280)
        img.autoSetDimension(.height, toSize: 260)
        return img
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false

        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "Professional"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // set root controller
        let rootNC = UINavigationController(rootViewController: self)
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = rootNC

        configureView()
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(bellImage)
        contentView.addSubview(burgerImage)
        contentView.addSubview(topFiveImage)
        contentView.addSubview(topLabelHeader)

        contentView.addSubview(people1Image)
        contentView.addSubview(people2Image)
        contentView.addSubview(people3Image)

        contentView.addSubview(arrowBtn)
        contentView.addSubview(yellowRectangle)
        contentView.addSubview(yellowRectImage)
        contentView.addSubview(pinkRectangle)
        contentView.addSubview(pinkRectImage)
        view.setNeedsUpdateConstraints()
    }

    private func setupConstraints() {
        let widthInset = 20.0

        scrollView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        scrollView.alwaysBounceVertical = true
//        scrollView.contentInsetAdjustmentBehavior = .never // ignire safeare

        contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        contentView.autoMatch(.width, to: .width, of: view)

        burgerImage.autoPinEdge(toSuperviewEdge: .top, withInset: 5)
        burgerImage.autoPinEdge(toSuperviewEdge: .right, withInset: widthInset)

        bellImage.autoPinEdge(toSuperviewEdge: .top)
        bellImage.autoAlignAxis(.vertical, toSameAxisOf: burgerImage, withOffset: -60)

        topFiveImage.autoPinEdge(toSuperviewSafeArea: .leading, withInset: widthInset)
        topFiveImage.autoPinEdge(.top, to: .bottom, of: bellImage, withOffset: 10)

        topLabelHeader.autoPinEdge(.left, to: .left, of: topFiveImage)
        topLabelHeader.autoPinEdge(.top, to: .bottom, of: topFiveImage, withOffset: 10)

        people1Image.autoPinEdge(.top, to: .bottom, of: topLabelHeader, withOffset: 25)
        people1Image.autoPinEdge(.left, to: .left, of: topLabelHeader)

        people2Image.autoPinEdge(.top, to: .top, of: people1Image)
        people2Image.autoPinEdge(.left, to: .right, of: people1Image, withOffset: 5.0)

        people3Image.autoPinEdge(.top, to: .top, of: people2Image)
        people3Image.autoPinEdge(.left, to: .right, of: people2Image, withOffset: 10.0)

        arrowBtn.autoPinEdge(toSuperviewEdge: .right, withInset: widthInset)
        arrowBtn.autoAlignAxis(.horizontal, toSameAxisOf: people3Image)

        yellowRectangle.autoPinEdge(.top, to: .bottom, of: people3Image, withOffset: 25)
        yellowRectangle.autoAlignAxis(toSuperviewAxis: .vertical)

        yellowRectImage.autoPinEdge(.bottom, to: .bottom, of: yellowRectangle, withOffset: 20)
        yellowRectImage.autoPinEdge(.right, to: .right, of: yellowRectangle)

        pinkRectangle.autoPinEdge(.top, to: .bottom, of: yellowRectImage, withOffset: 30)
        pinkRectangle.autoAlignAxis(toSuperviewAxis: .vertical)

        pinkRectImage.autoPinEdge(.bottom, to: .bottom, of: pinkRectangle, withOffset: 20)
        pinkRectImage.autoPinEdge(.right, to: .right, of: pinkRectangle)

        pinkRectangle.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1) // !
    }

    private func configureView() {
        view.backgroundColor = .white
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "home-bg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }

    @objc
    private func presentEmployeeController(sender _: UIButton) {
        let employeelVC = EmployeeViewController()
        navigationController?.pushViewController(employeelVC, animated: true)
    }
}
