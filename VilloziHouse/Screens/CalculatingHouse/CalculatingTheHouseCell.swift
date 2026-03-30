//
//  CalculatingTheHouseCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.02.2026.
//

import UIKit

class CalculatingTheHouseCell: UITableViewCell {
    
    static let identifier = "CalculatingTheHouseCell"
    
    private var images: [UIImage] = []
    
//    private let cardView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(red: 0.74, green: 0.9, blue: 0.78, alpha: 1.0)
//        view.layer.cornerRadius = 16
//        view.clipsToBounds = true
//        return view
//    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HouseImageCell.self, forCellWithReuseIdentifier: HouseImageCell.identifier)
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        return pageControl
    }()
    
    private let nameMaterialLabel: UILabel = {
        let label = UILabel()
        label.textColor = ConstantsColor.colorText
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceMaterialLabel: UILabel = {
        let label = UILabel()
        label.textColor = ConstantsColor.colorText
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var onSelect: ((Bool) -> Void)?
    private var isSelectedState = false
    private var isRadio = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameMaterialLabel.text = nil
        priceMaterialLabel.text = nil
        selectButton.tintColor = .lightGray
        
        images = []
        pageControl.currentPage = 0
    }
    func configureImagePage(images: [UIImage]) {
        self.images = images
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        collectionView.setContentOffset(.zero, animated: false)
        collectionView.reloadData()
    }
    
    func configure(
        with option: CalculatingTheHouseViewController.FinishingOption,
        selectionType: CalculatingTheHouseViewController.Category.Selection,
        isSelected: Bool
    ) {
        nameMaterialLabel.text = option.title
        priceMaterialLabel.text = formatPrice(Int(option.deltaRub))
        
        isRadio = (selectionType == .single)
        setSelected(isSelected)
    }
    
    private func formatPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = "."
        formatter.minusSign = "-"
        
        if let formattedPrice = formatter.string(from: NSNumber(value: price)) {
            return "+ \(formattedPrice) ₽"
        }
        return "\(price) ₽"
    }
    
    func setSelected(_ selected: Bool) {
        let imageName: String
        if isRadio {
            imageName = selected ? "circle.fill" : "circle"
        } else {
            imageName = selected ? "square.fill" : "square"
        }
        selectButton.setImage(UIImage(systemName: imageName), for: .normal)
        selectButton.tintColor = selected ? .systemBlue : .lightGray
    }
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    private func setupCell() {
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        
//        contentView.addSubview(cardView)
//        cardView.addSubview(pageControl)
//        cardView.addSubview(collectionView)
        contentView.addSubview(nameMaterialLabel)
        contentView.addSubview(priceMaterialLabel)
        contentView.addSubview(selectButton)
        
        NSLayoutConstraint.activate([
//            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            
//            collectionView.topAnchor.constraint(equalTo: cardView.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 200),
            
//            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -8),
//            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            selectButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            selectButton.heightAnchor.constraint(equalToConstant: 24),
            selectButton.widthAnchor.constraint(equalToConstant: 24),
            
            nameMaterialLabel.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor, constant: 8),
            nameMaterialLabel.trailingAnchor.constraint(equalTo: priceMaterialLabel.leadingAnchor, constant: -12),
            nameMaterialLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameMaterialLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            priceMaterialLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            priceMaterialLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        selectButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        priceMaterialLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        priceMaterialLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        nameMaterialLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameMaterialLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
    }
    @objc private func buttonTapped() {
        //        isSelectedState.toggle()
        //        setSelected(isSelectedState)
        //        onSelect?(isSelectedState)
    }
}

extension CalculatingTheHouseCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HouseImageCell.identifier, for: indexPath) as? HouseImageCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: images[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
extension CalculatingTheHouseCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
    }
}

#Preview {
    let navigationController = UINavigationController(
        rootViewController: CalculatingTheHouseViewController(houseId: "124-14")
    )
    return navigationController
}

//высота ячейки = размер элемента(14)
