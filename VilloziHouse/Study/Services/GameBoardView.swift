//
//  GameVC.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 09.04.2026.
//
import UIKit

// MARK: - Модель направления
enum Direction {
    case up, down, left, right
}

// MARK: - Кастомное представление для игры
class GameBoardView: UIView {
    var gridSize = 20
    var snake: [(x: Int, y: Int)] = []
    var food: (x: Int, y: Int) = (0, 0)
    var isGameRunning = false
    
    // Цвета
    private let snakeHeadColor = UIColor(red: 0.2, green: 0.8, blue: 0.2, alpha: 1.0)
    private let snakeBodyColor = UIColor(red: 0.3, green: 0.9, blue: 0.3, alpha: 1.0)
    private let foodColor = UIColor(red: 1.0, green: 0.3, blue: 0.3, alpha: 1.0)
    private let gridLineColor = UIColor(white: 0.9, alpha: 1.0)
    private let backgroundColorGame = UIColor(white: 0.95, alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawGameField()
    }
    
    private func drawGameField() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let rect = bounds
        let cellSize = rect.width / CGFloat(gridSize)
        
        // Заливка фона
        context.setFillColor(backgroundColorGame.cgColor)
        context.fill(rect)
        
        // Рисуем сетку
        context.setStrokeColor(gridLineColor.cgColor)
        context.setLineWidth(0.5)
        
        for i in 0...gridSize {
            let position = CGFloat(i) * cellSize
            context.move(to: CGPoint(x: position, y: 0))
            context.addLine(to: CGPoint(x: position, y: rect.height))
            context.strokePath()
            context.move(to: CGPoint(x: 0, y: position))
            context.addLine(to: CGPoint(x: rect.width, y: position))
            context.strokePath()
        }
        
        // Рисуем еду
        let foodRect = CGRect(
            x: CGFloat(food.x) * cellSize,
            y: CGFloat(food.y) * cellSize,
            width: cellSize - 1,
            height: cellSize - 1
        )
        context.setFillColor(foodColor.cgColor)
        context.fillEllipse(in: foodRect)
        
        // Рисуем змейку
        for (index, segment) in snake.enumerated() {
            let segmentRect = CGRect(
                x: CGFloat(segment.x) * cellSize,
                y: CGFloat(segment.y) * cellSize,
                width: cellSize - 1,
                height: cellSize - 1
            )
            
            if index == 0 {
                // Голова змейки
                context.setFillColor(snakeHeadColor.cgColor)
                context.fillEllipse(in: segmentRect)
                
                // Рисуем глаза
                context.setFillColor(UIColor.white.cgColor)
                let eyeSize = cellSize * 0.2
                let eyeOffset = cellSize * 0.25
                
                let leftEyeRect = CGRect(
                    x: segmentRect.minX + eyeOffset,
                    y: segmentRect.minY + eyeOffset,
                    width: eyeSize,
                    height: eyeSize
                )
                let rightEyeRect = CGRect(
                    x: segmentRect.maxX - eyeOffset - eyeSize,
                    y: segmentRect.minY + eyeOffset,
                    width: eyeSize,
                    height: eyeSize
                )
                
                context.fillEllipse(in: leftEyeRect)
                context.fillEllipse(in: rightEyeRect)
                
                context.setFillColor(UIColor.black.cgColor)
                let leftPupil = leftEyeRect.insetBy(dx: eyeSize * 0.2, dy: eyeSize * 0.2)
                let rightPupil = rightEyeRect.insetBy(dx: eyeSize * 0.2, dy: eyeSize * 0.2)
                context.fillEllipse(in: leftPupil)
                context.fillEllipse(in: rightPupil)
            } else {
                // Тело змейки
                context.setFillColor(snakeBodyColor.cgColor)
                let path = UIBezierPath(roundedRect: segmentRect, cornerRadius: 4)
                context.addPath(path.cgPath)
                context.fillPath()
            }
        }
        
        // Если игра не активна, показываем оверлей
        if !isGameRunning && !snake.isEmpty {
            context.setFillColor(UIColor.black.withAlphaComponent(0.5).cgColor)
            context.fill(rect)
            
            let text = "Нажмите\nСтарт"
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 24),
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyle
            ]
            
            let attributedString = NSAttributedString(string: text, attributes: attributes)
            let textSize = attributedString.size()
            let textRect = CGRect(
                x: rect.midX - textSize.width / 2,
                y: rect.midY - textSize.height / 2,
                width: textSize.width,
                height: textSize.height
            )
            attributedString.draw(in: textRect)
        }
    }
}

// MARK: - Основной класс контроллера
class ViewController: UIViewController {
    
    // MARK: - UI Элементы
    private let gameView = GameBoardView()
    private let scoreLabel = UILabel()
    private let startButton = UIButton(type: .system)
    
    // MARK: - Параметры игры
    private let gridSize = 20
    private var snake: [(x: Int, y: Int)] = []
    private var food: (x: Int, y: Int) = (0, 0)
    private var currentDirection: Direction = .right
    private var nextDirection: Direction = .right
    private var gameTimer: Timer?
    private var isGameRunning = false
    private var score = 0
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSwipeGestures()
        resetGame()
        updateGameDisplay()
        
        // Добавляем кнопку отладки
        print("Game loaded - нажмите кнопку Start")
    }
    
    // MARK: - Настройка UI
    private func setupUI() {
        view.backgroundColor = .white
        
        // Настройка игрового поля
        gameView.gridSize = gridSize
        gameView.backgroundColor = .white
        gameView.layer.borderWidth = 2
        gameView.layer.borderColor = UIColor.darkGray.cgColor
        gameView.layer.cornerRadius = 8
        gameView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameView)
        
        // Настройка Label со счетом
        scoreLabel.text = "Счет: 0"
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 24)
        scoreLabel.textAlignment = .center
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreLabel)
        
        // Настройка кнопки старта
        startButton.setTitle("Начать игру", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startButton.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0)
        startButton.setTitleColor(.white, for: .normal)
        startButton.layer.cornerRadius = 12
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        let stepButton = UIButton(type: .system)
        stepButton.setTitle("Шаг", for: .normal)
        stepButton.addTarget(self, action: #selector(manualStep), for: .touchUpInside)
        stepButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepButton)
        
//        NSLayoutConstraint.activate([
//            stepButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
//            stepButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stepButton.widthAnchor.constraint(equalToConstant: 100),
//            stepButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
        
        // Констрейнты
        NSLayoutConstraint.activate([
            gameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            gameView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            gameView.heightAnchor.constraint(equalTo: gameView.widthAnchor),
            
            scoreLabel.bottomAnchor.constraint(equalTo: gameView.topAnchor, constant: -20),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 40),
            
            startButton.topAnchor.constraint(equalTo: gameView.bottomAnchor, constant: 30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func manualStep() {
        if isGameRunning {
            gameTick()
        }
    }
    
    // MARK: - Настройка жестов
    private func setupSwipeGestures() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeUp.direction = .up
        gameView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeDown.direction = .down
        gameView.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        gameView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        gameView.addGestureRecognizer(swipeRight)
        
        gameView.isUserInteractionEnabled = true
    }
    
    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        guard isGameRunning else {
            print("Игра не запущена, свайп игнорируется")
            return
        }
        
        switch gesture.direction {
        case .up:
            if currentDirection != .down {
                nextDirection = .up
                print("Свайп вверх")
            }
        case .down:
            if currentDirection != .up {
                nextDirection = .down
                print("Свайп вниз")
            }
        case .left:
            if currentDirection != .right {
                nextDirection = .left
                print("Свайп влево")
            }
        case .right:
            if currentDirection != .left {
                nextDirection = .right
                print("Свайп вправо")
            }
        default:
            break
        }
    }
    
    // MARK: - Игровая логика
    @objc private func startGame() {
        print("Кнопка Start нажата!")
        
        resetGame()
        isGameRunning = true
        startButton.isEnabled = false
        startButton.alpha = 0.5
        startButton.setTitle("Игра идет...", for: .normal)
        
        // Останавливаем старый таймер если есть
        gameTimer?.invalidate()
        
        // Запускаем новый таймер
        gameTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(gameTick), userInfo: nil, repeats: true)
        
        print("Таймер запущен! Змейка должна двигаться")
        updateGameDisplay()
    }
    
    private func resetGame() {
        // Инициализация змейки (3 клетки в центре)
        let center = gridSize / 2
        snake = [
            (x: center, y: center),
            (x: center - 1, y: center),
            (x: center - 2, y: center)
        ]
        currentDirection = .right
        nextDirection = .right
        score = 0
        updateScoreLabel()
        generateRandomFood()
        
        print("Игра сброшена. Змейка в позиции: \(snake)")
    }
    
    private func generateRandomFood() {
        var newFood: (x: Int, y: Int)
        repeat {
            newFood = (x: Int.random(in: 0..<gridSize), y: Int.random(in: 0..<gridSize))
        } while snake.contains(where: { $0.x == newFood.x && $0.y == newFood.y })
        food = newFood
        
        print("Еда создана в позиции: \(food)")
    }
    
    @objc private func gameTick() {
        // Проверяем, запущена ли игра
        guard isGameRunning else {
            print("gameTick: игра не запущена")
            return
        }
        
        print("gameTick вызван! 🐍") // Это должно появляться в консоли каждые 0.2 секунды
        
        // Обновляем направление
        currentDirection = nextDirection
        
        // Вычисляем новую голову
        var newHead = snake[0]
        switch currentDirection {
        case .up:
            newHead.y -= 1
        case .down:
            newHead.y += 1
        case .left:
            newHead.x -= 1
        case .right:
            newHead.x += 1
        }
        
        print("Новая голова: \(newHead)")
        
        // Проверка столкновения с едой
        let willEatFood = (newHead.x == food.x && newHead.y == food.y)
        
        // Двигаем змейку
        if willEatFood {
            snake.insert(newHead, at: 0)
            score += 10
            updateScoreLabel()
            generateRandomFood()
            print("Съели еду! Счет: \(score)")
        } else {
            snake.insert(newHead, at: 0)
            snake.removeLast()
        }
        
        // Проверка столкновений
        if checkCollision() {
            print("Столкновение! Игра окончена")
            gameOver()
            return
        }
        
        // Обновляем отображение
        updateGameDisplay()
    }
    
    private func checkCollision() -> Bool {
        let head = snake[0]
        
        // Столкновение со стенами
        if head.x < 0 || head.x >= gridSize || head.y < 0 || head.y >= gridSize {
            print("Столкновение со стеной!")
            return true
        }
        
        // Столкновение с собой
        for segment in snake.dropFirst() {
            if segment.x == head.x && segment.y == head.y {
                print("Столкновение с собой!")
                return true
            }
        }
        
        return false
    }
    
    private func gameOver() {
        isGameRunning = false
        gameTimer?.invalidate()
        gameTimer = nil
        
        startButton.isEnabled = true
        startButton.alpha = 1.0
        startButton.setTitle("Начать игру", for: .normal)
        
        print("Игра окончена! Финальный счет: \(score)")
        
        // Показываем alert
        let alert = UIAlertController(
            title: "Игра окончена! 🐍",
            message: "Ваш счет: \(score)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
        updateGameDisplay()
    }
    
    private func updateScoreLabel() {
        DispatchQueue.main.async {
            self.scoreLabel.text = "Счет: \(self.score)"
        }
    }
    
    private func updateGameDisplay() {
        DispatchQueue.main.async {
            self.gameView.snake = self.snake
            self.gameView.food = self.food
            self.gameView.isGameRunning = self.isGameRunning
            self.gameView.setNeedsDisplay()
        }
    }
}
#Preview(traits: .portrait) {
    GameBoardView()
}
// Добавляем обновление в gameTick
// Нужно добавить вызов updateGameDisplay() в gameTick после изменения состояния
