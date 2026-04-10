//
//  ApplicationVC.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 22.02.2026.
//

import UIKit



protocol PriceUpdaterDelegate: AnyObject {
    func didUpdateTotalPrice(_ price: Double, formattedPrice: String)
}

final class ApplicationVC: UIViewController {
    weak var delegate: PriceUpdaterDelegate?
    
    private var houseName: String = ""
    private var totalPrice: Double = 0
    var receivedPrice: String = ""
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ваше имя"
        textField.backgroundColor = ConstantsColor.colorTextField
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.font = .systemFont(ofSize: 16)
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+7 (123) 456 78 90"
        textField.backgroundColor = ConstantsColor.colorTextField
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.font = .systemFont(ofSize: 16)
        textField.keyboardType = .phonePad
        textField.returnKeyType = .done
        textField.textColor = ConstantsColor.colorBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@mail.ru"
        textField.backgroundColor = ConstantsColor.colorTextField
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private let consentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let consentSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.onTintColor = ConstantsColor.villoziGreen
        //        switchControl.onTintColor = UIColor(named: "#4CAF50")
        return switchControl
    }()
    
    private let consentLabel: UILabel = {
        let label = UILabel()
        label.text = "Я согласен с условиями и политикой конфиденциальности"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отправить заявку", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена: 14 000 000 ₽"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.layer.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    //    ============
    //    Экран успеха
    //    ============
    private let successView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.text = "\("Заявка успешно отправлена")"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let successImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle"))
        imageView.tintColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let successSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Менеджер компании свяжется с вами в ближайшее время. Наш выствочный дом работает ежедневно с 10:00 до 19:00"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("На главный экран", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(ConstantsColor.colorButton, for: .normal)
        button.backgroundColor = UIColor(named: "#10e161")
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //    ===========
    
    init(houseName: String, totalPrice: Double, formattedPrice: String) {
        self.houseName = houseName
            self.totalPrice = totalPrice
            self.receivedPrice = formattedPrice
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setupKeyboardHandling()
        view.backgroundColor = .systemBackground
        priceLabel.text = "Предварительная стоимость дома: \(receivedPrice) ₽"
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
        
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func emailTextFieldDidChange() {
        if let email = emailTextField.text, !email.isEmpty {
            if isValidEmail(email) {
                emailTextField.backgroundColor = ConstantsColor.colorTextSelected
                emailTextField.layer.borderColor = UIColor.clear.cgColor
                emailTextField.layer.borderWidth = 0
            } else {
                emailTextField.backgroundColor = UIColor.red.withAlphaComponent(0.1)
                emailTextField.layer.borderColor = UIColor.red.cgColor
                emailTextField.layer.borderWidth = 1
            }
        } else {
            emailTextField.backgroundColor = ConstantsColor.colorTextField
            emailTextField.layer.borderColor = UIColor.clear.cgColor
            emailTextField.layer.borderWidth = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // запутался в скобках
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNavigationBar() {
        title = "Заявка на расчет"
        navigationItem.largeTitleDisplayMode = .never
    }
    func didUpdateTotalPrice(_ price: Double, formattedPrice: String) {
            DispatchQueue.main.async { [weak self] in
                self?.priceLabel.text = "Цена: \(formattedPrice)"
            }
        }
    
    private func setupUI() {
        avatarsStackView.spacing = 12
        avatarsStackView.distribution = .fill
        avatarsStackView.alignment = .center
        let avatar1 = makeAvatarView(named: "manager1", color: .systemBlue)
        let avatar3 = makeAvatarView(named: "manager3", color: .systemYellow)
        let avatar4 = makeAvatarView(named: "manager4", color: .systemGreen)
        let avatar5 = makeAvatarView(named: "manager5", color: .systemOrange)
        let avatar6 = makeAvatarView(named: "manager6", color: .systemGray)
        avatarsStackView.addArrangedSubview(avatar1)
        avatarsStackView.addArrangedSubview(avatar3)
        avatarsStackView.addArrangedSubview(avatar4)
        avatarsStackView.addArrangedSubview(avatar5)
        avatarsStackView.addArrangedSubview(avatar6)
        
        consentStackView.addArrangedSubview(consentLabel)
        consentStackView.addArrangedSubview(consentSwitch)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        let priceStr = formatter.string(from: NSNumber(value: totalPrice)) ?? "\(totalPrice)"
        priceLabel.text = "Предварительная стоимость дома: \(priceStr) ₽"
        
        
        
        contentView.addSubview(avatarsStackView)
        contentView.addSubview(nameTextField)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(consentStackView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(submitButton)
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        successView.addSubview(successImageView)
        successView.addSubview(successLabel)
        successView.addSubview(successSubtitleLabel)
        successView.addSubview(doneButton)
        view.addSubview(successView)
        
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        nameTextField.delegate = self
        phoneTextField.delegate = self
        
        setupConstrains()
    }
    private func makeAvatarView(named name: String, color: UIColor) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        let avatarSize: CGFloat = 64
        container.widthAnchor.constraint(equalToConstant: avatarSize).isActive = true
        container.heightAnchor.constraint(equalToConstant: avatarSize).isActive = true
        
        let iv = UIImageView()
        iv.image = UIImage(named: name)
        iv.tintColor = color
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = avatarSize / 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(iv)
        
        NSLayoutConstraint.activate([
            iv.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iv.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iv.widthAnchor.constraint(equalTo: container.widthAnchor),
            iv.heightAnchor.constraint(equalTo: container.heightAnchor)
        ])
        
        return container
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            avatarsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            avatarsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
            avatarsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            nameTextField.topAnchor.constraint(equalTo: avatarsStackView.bottomAnchor, constant: 28),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            phoneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 12),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            consentStackView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            consentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            consentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: consentStackView.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            submitButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            successView.topAnchor.constraint(equalTo: view.topAnchor),
            successView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            successView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            successView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            successImageView.centerXAnchor.constraint(equalTo: successView.centerXAnchor),
            successImageView.centerYAnchor.constraint(equalTo: successView.centerYAnchor, constant: -80),
            successImageView.widthAnchor.constraint(equalToConstant: 80),
            successImageView.heightAnchor.constraint(equalToConstant: 80),
            
            successLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 20),
            successLabel.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 32),
            successLabel.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -32),
            
            successSubtitleLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 12),
            successSubtitleLabel.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 32),
            successSubtitleLabel.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -32),
            
            doneButton.topAnchor.constraint(equalTo: successSubtitleLabel.bottomAnchor, constant: 32),
            doneButton.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -16),
            doneButton.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    private func setupKeyboardHandling() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        scrollView.contentInset.bottom = keyboardFrame.height + 20
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
    }
    
    
    private func validateForm() -> Bool {
        guard let name = nameTextField.text, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            showValidationError("Введите Ваше имя")
            return false
        }
        
        guard let phone = phoneTextField.text, phone.count >= 10 else {
            showValidationError("Введите корректный номер телефона")
            return false
        }
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty else {
            showValidationError("Введите корректный e-mail (например: name@domain.com)")
            return false
        }
        guard isValidEmail(email) else {
            showValidationError("Введите корректный e-mail")
            return false
        }
        return true
    }
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func showValidationError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func submitButtonTapped() {
        view.endEditing(true)
        guard validateForm() else { return }
        
        submitButton.isEnabled = false
        submitButton.setTitle("Заявка отправляется...", for: .normal)
        
        submitForm(completion: { isSuccess in
            
            if isSuccess {
                self.submitButton.setTitle("Заявка отправлена...", for: .normal)
                self.showSuccessScreen()
            } else {
                self.submitButton.isEnabled = true
                self.submitButton.setTitle("Заявка не отправлена", for: .normal)
            }
        })
    }
    
    @objc private func doneButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func submitForm(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(true)
        }
    }
    
    private func showSuccessScreen() {
        UIView.animate(withDuration: 0.4, animations: {
            self.successView.alpha = 1
            self.successView.transform = .identity
        })
        successImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(
            withDuration: 0.6,
            delay: 0.2,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.8,
            options: [],
            animations: {
                self.successImageView.transform = .identity
            }
        )
    }
}

extension ApplicationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            phoneTextField.resignFirstResponder()
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.systemBlue.cgColor
            textField.layer.cornerRadius = 8
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 0
        }
    }
    
}

//extension ApplicationVC: UIGestureRecognizerDelegate {
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return navigationController?.viewControllers.count ?? 0 > 1
//    }
//}


#Preview {
    let vc = ApplicationVC(houseName: "60-23 Виллози-дом", totalPrice: 1_630_908, formattedPrice: "цена")
    UINavigationController(rootViewController: vc)
}
