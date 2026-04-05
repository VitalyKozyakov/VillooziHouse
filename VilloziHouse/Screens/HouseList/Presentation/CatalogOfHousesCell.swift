//
//  CatalogOfHousesCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit

protocol HouseCellDelegate: AnyObject {
    func didToggleFavorite(in cell: CatalogOfHousesCell, state: Bool)
}
    // ШАГ 2 Создаем КолекциюВью
// ШАГ 3 Создаем пейджКонтрол
final class CatalogOfHousesCell: UITableViewCell {
    
    static let reuseIdentifier: String = "CatalogOfHousesCell"
    weak var delegate: HouseCellDelegate?
    private var isFavorite: Bool = false
// ШАГ4 создали пустой массив картинок для будущего хранения коллекции картинок
    private var images: [UIImage] = []
    // MARK: - UI
    
    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.74, green: 0.9, blue: 0.78, alpha: 1.0)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
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
    
//    private let imageViewHouse: UIImageView = {
//        let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 12
//        imageView.tintColor = .systemGray3
//        imageView.contentMode = .center
//        imageView.backgroundColor = .systemGray6
//        return imageView
//    }()
    
    private let nameHouseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let squareLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let infoHouseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let priceHouseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // ШАГ7 обновляем переиспользование параметров для следующей(открыто) ячейки
    override func prepareForReuse() {
        super.prepareForReuse()
//        imageViewHouse.image = nil
        images = []
        pageControl.currentPage = 0
        isFavorite = false
        updateFavoriteButton(isFavorite: false)
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        // ШАГ8 добавили действие. для пейджика
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        
        contentView.addSubview(cardView)
        
        [collectionView, pageControl, nameHouseLabel, squareLabel, infoHouseLabel, priceHouseLabel, favoriteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            cardView.addSubview($0)
        }
    }
    // был на 0 пейдже, нажал 3, ширина видимой коллекции 300
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    private func updateFavoriteButton(isFavorite: Bool) {
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            collectionView.topAnchor.constraint(equalTo: cardView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            
            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -8),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            favoriteButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            favoriteButton.widthAnchor.constraint(equalToConstant: 32),
            favoriteButton.heightAnchor.constraint(equalToConstant: 32),
            
            
            nameHouseLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            nameHouseLabel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            nameHouseLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            
            squareLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            squareLabel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            squareLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            squareLabel.widthAnchor.constraint(equalToConstant: 100),
            
            infoHouseLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            infoHouseLabel.leadingAnchor.constraint(equalTo: squareLabel.trailingAnchor, constant: 8),
            infoHouseLabel.bottomAnchor.constraint(equalTo: squareLabel.bottomAnchor),
            infoHouseLabel.widthAnchor.constraint(equalToConstant: 150),
            
            priceHouseLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            priceHouseLabel.leadingAnchor.constraint(equalTo: infoHouseLabel.trailingAnchor, constant: 8),
            priceHouseLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            priceHouseLabel.widthAnchor.constraint(equalToConstant: 150),
            priceHouseLabel.bottomAnchor.constraint(equalTo: squareLabel.bottomAnchor),
        ])
    }
    
    private func setupActions() {
        favoriteButton.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
    }
    
    @objc private func favoriteTapped() {
        isFavorite.toggle()
        updateFavoriteButton(isFavorite: isFavorite)
        delegate?.didToggleFavorite(in: self, state: isFavorite)
    }
    
    func configure(with house: House) {
        isFavorite = house.isFavorite
        nameHouseLabel.text = house.name
        squareLabel.text = "📐 \(house.formattedArea) м²"
        infoHouseLabel.text = " \(house.formattedRooms) | \(house.dimensions)"
        priceHouseLabel.text = house.formattedPrice
        updateFavoriteButton(isFavorite: isFavorite)
        
//        if let imageProject = house.imageProject,
//           let image = UIImage(named: imageProject) {
//            imageViewHouse.image = image
//            imageViewHouse.contentMode = .scaleAspectFill
//        } else {
//            imageViewHouse.image = UIImage(systemName: "house.fill")
//            imageViewHouse.contentMode = .scaleAspectFit
//        }
    }
    // ШАГ9
    func configure(images: [UIImage]) {
        self.images = images
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        collectionView.setContentOffset(.zero, animated: false)
        collectionView.reloadData()
    }
}
//  коробка тэйблВьюСелл -> (весы-картинок) -> колекшнВью -> колекшнВьюСелл -> картинку(для отображения)
// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
// ШАГ5 создаем делегаты для колекцииВью
extension CatalogOfHousesCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count //из ШАГ4()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HouseImageCell.identifier,
            for: indexPath
        ) as? HouseImageCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: images[indexPath.item])
        return cell
    }
    //  ШАГ6  Настраиваем размер ячейки согласно загружаемому объекту
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

// MARK: - UIScrollViewDelegate
//ШАГ10 высчитываем по координатам на какой странице(картинке) мы находимся, для того, чтобы пейджик отображал нужную страницу(текущую)
extension CatalogOfHousesCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
}


#Preview {
    let viewController = CatalogOfHousesViewController(dataSource: CatalogOfHousesDataSourse())
    return viewController
}
