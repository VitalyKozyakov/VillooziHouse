//
//  ApplicationViewController.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 22.02.2026.
//


import UIKit

final class ApplicationViewController: UIViewController {

    // =========================================================================
    // MARK: - Данные
    // =========================================================================

    private let houseName: String
    private let totalPrice: Int

    // =========================================================================
    // MARK: - UI-элементы — Форма
    // =========================================================================

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    // Аватары (два кружка с иконками людей)
    private let avatarsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = -10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    // Поле "Ваше имя"
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Ваше имя"
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 16)
        tf.returnKeyType = .next
        tf.autocorrectionType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    // Поле "Телефон"
    private let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "+7 (999) 123-45-67"
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 16)
        tf.keyboardType = .phonePad
        tf.returnKeyType = .done
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    // Строка с чекбоксом согласия
    private let consentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let consentSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = true
        sw.onTintColor = .systemBlue
        return sw
    }()

    private let consentLabel: UILabel = {
        let l = UILabel()
        l.text = "Я соглашаюсь на обработку персональных данных"
        l.font = .systemFont(ofSize: 13, weight: .regular)
        l.textColor = .secondaryLabel
        l.numberOfLines = 2
        return l
    }()

    // Кнопка "Отправить заявку"
    private let submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Отправить заявку", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    // Лейбл с итоговой суммой
    private let priceInfoLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14, weight: .regular)
        l.textColor = .secondaryLabel
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    // =========================================================================
    // MARK: - UI-элементы — Экран успеха
    // =========================================================================

    // Этот контейнер показывается после успешной отправки
    private let successView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.alpha = 0 // Изначально невидим
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let successIconView: UIImageView = {
        let iv = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .medium)
        iv.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        iv.tintColor = .systemGreen
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let successTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Заявка отправлена!"
        l.font = .systemFont(ofSize: 22, weight: .bold)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let successSubtitleLabel: UILabel = {
        let l = UILabel()
        l.text = "В ближайшее время с вами свяжется наш менеджер"
        l.font = .systemFont(ofSize: 15, weight: .regular)
        l.textColor = .secondaryLabel
        l.textAlignment = .center
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let doneButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Готово", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    // =========================================================================
    // MARK: - Инициализатор
    // =========================================================================

    init(houseName: String, totalPrice: Int) {
        self.houseName = houseName
        self.totalPrice = totalPrice
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // =========================================================================
    // MARK: - Жизненный цикл
    // =========================================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setupKeyboardHandling()
    }

    // 📚 viewWillAppear — каждый раз при появлении экрана
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на уведомления о клавиатуре
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // 📚 viewWillDisappear — отписываемся от уведомлений
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    // =========================================================================
    // MARK: - Настройка UI
    // =========================================================================

    private func setupNavigationBar() {
        title = "Заявка"
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        // Аватары
        let avatar1 = makeAvatarView(systemName: "person.circle.fill", color: .systemBlue)
        let avatar2 = makeAvatarView(systemName: "person.circle.fill", color: .systemGray3)
        avatarsStackView.addArrangedSubview(avatar1)
        avatarsStackView.addArrangedSubview(avatar2)

        // Согласие
        consentStackView.addArrangedSubview(consentSwitch)
        consentStackView.addArrangedSubview(consentLabel)

        // Цена
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        let priceStr = formatter.string(from: NSNumber(value: totalPrice)) ?? "\(totalPrice)"
        priceInfoLabel.text = "Итоговая стоимость: \(priceStr) ₽"

        // Добавляем элементы в contentView
        contentView.addSubview(avatarsStackView)
        contentView.addSubview(nameTextField)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(consentStackView)
        contentView.addSubview(priceInfoLabel)
        contentView.addSubview(submitButton)

        // Добавляем scrollView
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)

        // Экран успеха
        successView.addSubview(successIconView)
        successView.addSubview(successTitleLabel)
        successView.addSubview(successSubtitleLabel)
        successView.addSubview(doneButton)
        view.addSubview(successView)

        // Действия кнопок
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)

        // Делегаты текстовых полей
        nameTextField.delegate = self
        phoneTextField.delegate = self

        setupConstraints()
    }

    private func makeAvatarView(systemName: String, color: UIColor) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalToConstant: 56).isActive = true
        container.heightAnchor.constraint(equalToConstant: 56).isActive = true

        let iv = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
        iv.image = UIImage(systemName: systemName, withConfiguration: config)
        iv.tintColor = color
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(iv)

        NSLayoutConstraint.activate([
            iv.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iv.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])

        return container
    }

    private func setupConstraints() {
//        let nameLabel1 = nameImage(nameImage: "manager1", nameLabel: "Vitaliy")
//        let nameLabel2 = nameImage(nameImage: "manager2", nameLabel: "Roman")
//        contentView.addSubview(nameLabel1)
//        contentView.addSubview(nameLabel2)
        
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Аватары
            avatarsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            avatarsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // Поле имени
            nameTextField.topAnchor.constraint(equalTo: avatarsStackView.bottomAnchor, constant: 32),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            // Поле телефона
            phoneTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            phoneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 50),

            // Согласие
            consentStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            consentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            consentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // Цена
            priceInfoLabel.topAnchor.constraint(equalTo: consentStackView.bottomAnchor, constant: 20),
            priceInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // Кнопка отправки
            submitButton.topAnchor.constraint(equalTo: priceInfoLabel.bottomAnchor, constant: 24),
            submitButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 54),
            submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
//            nameLabel1.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 16),
//            nameLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            nameLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            nameLabel1.heightAnchor.constraint(equalToConstant: 50),
//            
//            nameLabel2.topAnchor.constraint(equalTo: nameLabel1.bottomAnchor, constant: 16),
//            nameLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            nameLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            nameLabel2.heightAnchor.constraint(equalToConstant: 50),
//            nameLabel2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),

            // Экран успеха — поверх всего
            successView.topAnchor.constraint(equalTo: view.topAnchor),
            successView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            successView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            successView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Иконка успеха
            successIconView.centerXAnchor.constraint(equalTo: successView.centerXAnchor),
            successIconView.centerYAnchor.constraint(equalTo: successView.centerYAnchor, constant: -80),
            successIconView.widthAnchor.constraint(equalToConstant: 80),
            successIconView.heightAnchor.constraint(equalToConstant: 80),

            // Заголовок успеха
            successTitleLabel.topAnchor.constraint(equalTo: successIconView.bottomAnchor, constant: 20),
            successTitleLabel.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 32),
            successTitleLabel.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -32),

            // Подзаголовок успеха
            successSubtitleLabel.topAnchor.constraint(equalTo: successTitleLabel.bottomAnchor, constant: 12),
            successSubtitleLabel.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 32),
            successSubtitleLabel.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -32),

            // Кнопка "Готово"
            doneButton.topAnchor.constraint(equalTo: successSubtitleLabel.bottomAnchor, constant: 32),
            doneButton.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -16),
            doneButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }

    // =========================================================================
    // MARK: - Обработка клавиатуры
    // =========================================================================

    private func setupKeyboardHandling() {
        // Скрываем клавиатуру по тапу на экран
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // 📚 NotificationCenter — система уведомлений iOS.
    //    Клавиатура отправляет уведомление когда появляется/скрывается.
    //    Мы подписываемся и сдвигаем контент вверх.
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        scrollView.contentInset.bottom = keyboardFrame.height + 20
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
    }

    // =========================================================================
    // MARK: - Валидация формы
    // =========================================================================

    private func validateForm() -> Bool {
        guard let name = nameTextField.text, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            showValidationError("Введите ваше имя")
            return false
        }
        guard let phone = phoneTextField.text, phone.count >= 10 else {
            showValidationError("Введите корректный номер телефона")
            return false
        }
        guard consentSwitch.isOn else {
            showValidationError("Необходимо согласие на обработку данных")
            return false
        }
        return true
    }

    private func showValidationError(_ message: String) {
        let alert = UIAlertController(title: "Заполните форму", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // =========================================================================
    // MARK: - Actions
    // =========================================================================

    @objc private func submitButtonTapped() {
        view.endEditing(true)

        guard validateForm() else { return }

        // Имитируем отправку заявки
        submitButton.isEnabled = false
        submitButton.setTitle("Отправляем...", for: .normal)

        // 📚 DispatchQueue.main.asyncAfter — выполнить код через N секунд
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.showSuccessScreen()
        }
    }

    @objc private func doneButtonTapped() {
        // Возвращаемся на главный экран (pop до корня навигации)
        navigationController?.popToRootViewController(animated: true)
    }

    // =========================================================================
    // MARK: - Экран успеха
    // =========================================================================

    private func showSuccessScreen() {
        // 📚 UIView.animate — плавная анимация изменения свойств.
        //    duration: 0.4 — длительность в секундах
        //    animations: — замыкание с изменениями (что анимировать)
        //    completion: — замыкание после завершения анимации
        UIView.animate(withDuration: 0.4, animations: {
            self.successView.alpha = 1
            self.successView.transform = .identity
        })

        // Анимируем иконку
        successIconView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        UIView.animate(
            withDuration: 0.6,
            delay: 0.2,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.8,
            options: [],
            animations: {
                self.successIconView.transform = .identity
            }
        )
    }
}

// =============================================================================
// MARK: - UITextFieldDelegate
// =============================================================================
//
// 📚 Протокол UITextFieldDelegate — получаем уведомления от текстовых полей.
//    Реализуем в extension для чистоты кода.

extension ApplicationViewController: UITextFieldDelegate {

    // Нажата кнопка Return/Next на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            // Переходим к следующему полю
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            // Скрываем клавиатуру
            phoneTextField.resignFirstResponder()
        }
        return true
    }

    // Поле получило фокус
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Подсвечиваем активное поле
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.systemBlue.cgColor
            textField.layer.cornerRadius = 8
        }
    }

    // Поле потеряло фокус
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 0
        }
    }
}

// =============================================================================
// MARK: - Preview
// =============================================================================

#Preview {
    let vc = ApplicationViewController(houseName: "60-23 Виллози-дом", totalPrice: 1_630_908)
    return UINavigationController(rootViewController: vc)
}


extension ApplicationViewController {
    func test() {
        // var — переменная, можно изменить
        var score = 0
        score = 10

        // let — константа, изменить нельзя
        let appName = "CafeApp"
        // appName = "Other" // ❌ ошибка компиляции
        
        
        let title = "Капучино"
        let price: Int     = 350
        let rating: Double = 4.8
        let isAvailable: Bool = true
        
        struct MenuItem {
            let id: Int
            let title: String
            var price: Int
            let category: String
            
            init(id: Int, title: String, price: Int, category: String) {
                self.id = id
                self.title = title
                self.price = price
                self.category = category
            }
        }

        // Создаём экземпляр
        let coffee = MenuItem(id: 1, title: "Капучино", price: 350, category: "Напитки")
        print(coffee.title)  // "Капучино"
        print(coffee.price)  // 350
        
        var item1 = MenuItem(id: 1, title: "Латте", price: 400, category: "Напитки")
        var item2 = item1   // создаётся КОПИЯ
        item1.price = 500
        // item1 и item2 — независимые объекты
        
        enum Category {
            case drinks
            case food
            case desserts
        }

        let myCategory = Category.drinks
        if case .drinks = myCategory {
            print("Это раздел Напитки")
        }
        
        
        // Используем в switch
        switch myCategory {
        case .drinks:
            print("Раздел: Напитки")
        case .food:
            print("Раздел: Еда")
        case .desserts:
            print("Раздел: Десерты")
        }
        
        // Enum с `rawValue` — каждый кейс имеет значение:

        
        enum Category1: String {
            case drinks   = "Напитки"
            case food     = "Еда"
            case desserts = "Десерты"
        }
        
        let myCategory1 = Category1.drinks

        print(myCategory1.rawValue)  // "Напитки"
        
        
        // Optional означает: значение **есть** или его **нет** (`nil`).
        var phoneNumber: String? = nil   // нет номера
        phoneNumber = "+7 999 123 45 67" // теперь есть

        print(phoneNumber!) // **Никогда не используй `!` (force unwrap) в продакшн-коде** — это краш если значение `nil`.
        
        // Безопасное извлечение — if let
        if let phone = phoneNumber {
            print("Телефон: \(phone)")
        } else {
            print("Телефон не указан")
        }

        // guard let — выходим из функции если nil
        func showPhone(_ number: String?) {
            guard let number = number else {
                print("Нет номера")
                return
            }
            print("Звоним: \(number)")
        }
        
        // Массивы и словари

        // Array — упорядоченный список
        var items: [MenuItem] = []
        items.append(coffee)
        items += [item1]

        // Перебор
        for item in items {
            print("\(item.title) — \(item.price) ₽")
        }

        // filter — оставляем только подходящие элементы
        let drinks = items.filter { $0.category == "Напитки" }
        // struct with dish and price - MenuItem -> Struct
        
        struct OrderItem {
            let dish: String
            let price: Int
        }

        let dishPrice: [OrderItem] = items.map { item in
            let newPrice = item.price * 2
            return OrderItem.init(dish: item.title, price: newPrice)
        }

        // map — преобразуем каждый элемент
        let titles: [String] = items.map { item in item.title }
        // Dictionary — словарь ключ:значение
        var cart: [Int: Int] = [:]   // [id товара: количество]
        cart[1] = 2   // добавили 2 капучино
        cart[1, default: 0] += 1  // увеличили на 1
        
        // 1.7 Функции

        // Базовая функция
        func greet(name: String) -> String {
            return "Привет, \(name)!"
        }

        let message = greet(name: "Анна")

        // Функция с несколькими параметрами
        func calculateTotal(price: Int, quantity: Int) -> Int {
            return price * quantity
        }

        // Внешнее и внутреннее имя параметра
        func add(_ a: Int, to b: Int) -> Int {
            return a + b
        }
        let result = add(5, to: 3)  // вызов: add(5, to: 3)
        
        let vitaliyStackView = nameImage(nameImage: "vitaliy", nameLabel: "Виталий")
        
        
        
        func makeAvatarView1(systemName: String, color: UIColor) -> UIView {
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.widthAnchor.constraint(equalToConstant: 56).isActive = true
            container.heightAnchor.constraint(equalToConstant: 56).isActive = true
            
            let iv = UIImageView()
            let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
            iv.image = UIImage(systemName: systemName, withConfiguration: config)
            iv.tintColor = color
            iv.contentMode = .scaleAspectFit
            iv.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(iv)
            
            NSLayoutConstraint.activate([
                iv.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                iv.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            ])
            
            return container
        }
        
        
        
    }
    
    // функция возращает стеквью из картинки и лейбла: которая принимает название картинки и текст для лейбла
     
            // - Image _ Text
            // - Image _ Text
            // - Image _ Text
    func nameImage(nameImage: String, nameLabel: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = nameLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: nameImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        return stackView
    }
}


extension ApplicationViewController {
    func classes() {
        class BankAccount {
            var balance: Int = 0
            var addressUser: String
            var codeWord: String
            
            init(balance: Int = 0, addressUser: String, codeWord: String) {
                self.balance = balance
                self.addressUser = addressUser
                self.codeWord = codeWord
            }
            
            func deposit(_ amount: Int) {
                balance += amount
            }
            
            func withdraw(_ amount: Int) -> Bool {
                guard amount <= balance else { return false }
                balance -= amount
                return true
            }
        }
        
        let vitaliyAccount = BankAccount(addressUser: "Sochi", codeWord: "Bobik")
        
        func deposit(account: BankAccount) {
            account.balance += 100
        }
        
        deposit(account: vitaliyAccount)
        
        print(vitaliyAccount.balance) // 100
        
        let romanAccount = vitaliyAccount
        romanAccount.balance = 0
        
        print(vitaliyAccount.balance) // 0
        
        
        // Vehicle
        
        class Vehicle {
            func move() {
                print("Moving...")
            }
        }
        
        class Car: Vehicle {
            var numberOfDoors: Int
            
            init(numberOfDoors: Int) {
                self.numberOfDoors = numberOfDoors
            }
            
            func openTrunk() {
                print("Trunk is opened")
            }
        }
        
        class Motocross: Vehicle {
            func doKickflip() {
                print("Kickflipping!")
            }
        }
    }
    
    func structs() {
        struct User {
            var name: String
            var age: Int
        }
        
        let userVitaliy = User(name: "Vitaliy", age: 30)
        var userRoman = userVitaliy
        userRoman.name = "Roman"
        
        print(userVitaliy.name)
        print(userRoman.name)   
    }
    
    func closures() {
        func greet(_ name: String) -> String {
            "Hello, \(name)!"
        }
        
        _ = greet("Vitaliy")
        
        let anotherGreet: (String) -> String = { name in
            "Hello, \(name)!"
        }
        
        _ = anotherGreet("Vitaliy")
        
        let multiply: (Int, Int) -> Int = { a, b in
            a * b
        }
        
        _ = multiply(2, 3)
        
        
        // Функция принимает замыкание — "что делать после загрузки"
        func loadMenu(completion: ([String]) -> Void) {
            // Имитируем загрузку данных
            let items = ["Капучино", "Латте", "Американо"]
            completion(items)  // вызываем замыкание с результатом
        }

        // Использование — trailing closure синтаксис
        loadMenu { items in
            print("Загружено позиций: \(items.count)")
        }
        
        // ❌ Не скомпилируется — замыкание вызывается позже, но не помечено @escaping
//        func loadMenuAsync(completion: ([String]) -> Void) {
//            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
//                completion([])  // ❌ Ошибка: "escaping closure captures non-escaping parameter"
//            }
//        }
        
        // ✅ Правильно — @escaping говорит компилятору: "это замыкание вызовется позже"
        func loadMenuAsync(completion: @escaping ([String]) -> Void) {
            let items = ["Капучино", "Латте", "Американо"]
            let items1 = items.filter { $0 == "Kapuchino" }
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
                completion([])  // ✅ всё хорошо
            }
        }
        
        class Cart {
            
            var onUpdated: (() -> Void)?
            
            private(set) var items: [String] = []
            
            func addItem(_ item: String) {
                items.append(item)
                onUpdated?()  // ? — безопасный вызов: если nil, ничего не происходит
            }
            
            func removeItem(at index: Int) {
                items.remove(at: index)
                onUpdated?()
            }
        }
        
        let vitaliyCart = Cart()
        vitaliyCart.addItem("Cucumber")
        vitaliyCart.addItem("Tomato")
        vitaliyCart.addItem("Milk")
        vitaliyCart.removeItem(at: 0)
        
        vitaliyCart.onUpdated = {
            print("Card updated!")
            // tableView.reloadData()
            // cartPriceSum = cartPriceSum + item.price
        }
    }
    
    
    func closuress() {
        func sayHello() {
            print("Привет!")
        }
        
        sayHello()
        
        let helloClosure: () -> Void = {
            print("Привет!")
        }
        
        helloClosure()
        
        var counter = 0
        
        let increment = {
            counter += 1
            print("Счётчик: \(counter)")
        }
        
        increment() // 1
        increment() // 2
        
        // () -> Void
        
        // (Int) -> Void
        // (Int, Int) -> Int
        
        let printPrice: (Int) -> Void = { price in
            print("Цена: \(price) ₽")
        }

        printPrice(350)
        
        let sum: (Int, Int) -> Int = { a, b in
            return a + b
        }

        let result = sum(5, 7)
        print(result)
        
        let multiply: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
            return a * b
        }
        
        let multiply2: (Int, Int) -> Int = { a, b in
            a * b
        }
        
        let multiply4: (Int, Int) -> Int = {
            $0 * $1
        }
        
        // when to use $0
        
        let titles = ["Латте", "Чай", "Какао"].map { /*title in title.uppercased()*/ $0.uppercased() }
        
        
        func performAction(test: String, action: () -> Void) {
            print("Сейчас выполню действие")
            action()
            print("Действие завершено")
        }
        
        performAction(test: "Test", action: {
            print("Нажали hello")
        })
        
        performAction(test: "Test") {
            print("Нажали кнопку")
        }
        
        performAction(test: "Test") {
            print("Нажали TOGGLE")
        }
        
        
        
    }
}

