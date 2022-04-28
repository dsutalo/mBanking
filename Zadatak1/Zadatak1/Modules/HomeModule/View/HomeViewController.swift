import UIKit
import Toast

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    private lazy var homeView = HomeView()
    private let style = ToastStyle()
    
    //MARK: - Init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Life cycle
    
    override func loadView() {
        self.view = homeView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        if let homeModel = UserDefaults.standard.load() {
            viewModel.homeModel = homeModel
        } else {
            viewModel.homeModel = HomeModel()
        }
        
        addCallbacks()
        manageKeyboard()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        UserDefaults.standard.save(self.viewModel.homeModel)
    }
}

//MARK: - Extension

private extension HomeViewController {
    
    //MARK: - Keyboard methods
    
    private func manageKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //MARK: - Callbacks
    
    private func addCallbacks() {
        homeView.onRegisterButtonTapped = { [weak self] in
            guard let text = self?.homeView.enterPasswordTextField.text else { return }
            self?.passwordValidation(text: text)
        }
        homeView.reloadView(isLogin: viewModel.homeModel.isLogin)
    }
    
    //MARK: - Password check
    
    private func passwordValidation(text: String) {
        PasswordValidator.checkEnteredPassword(viewModel: self.viewModel, view: view, text: text)
    }
}
