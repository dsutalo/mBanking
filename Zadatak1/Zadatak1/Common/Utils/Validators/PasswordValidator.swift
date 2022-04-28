import Foundation
import Toast
import UIKit

class PasswordValidator {
    static let style = ToastStyle()
    
    static func checkEnteredPassword(viewModel:HomeViewModel,view: UIView,text: String) {
        if !(text.isEmpty) {
            handlePasswordLenght(viewModel:viewModel, view:view, text: text)
        } else {
            view.makeToast("Password field is empty", duration: 1.0, position: .center , style: style)
        }
    }
    
    static func handlePasswordLenght(viewModel:HomeViewModel,view: UIView,text: String) {
        if (text.count) >= 4 && (text.count) <= 6 {
            checkScreen(viewModel:viewModel, view:view, text: text)
        } else {
            view.makeToast("Password needs to be in range from 4 to 6 digits",duration: 1.5,position: .center, style: style)
        }
    }
    
    static func checkScreen(viewModel:HomeViewModel,view: UIView,text: String) {
        if viewModel.homeModel.isLogin {
            handleLoginScreen(viewModel:viewModel, view:view, text: text)
        } else {
            handleRegisterScreen(viewModel:viewModel, view:view, text: text)
        }
    }
    
    static func handleLoginScreen(viewModel:HomeViewModel,view: UIView,text: String) {
        if text == viewModel.homeModel.password {
            viewModel.openAccountsList()
            view.endEditing(true)
        } else {
            view.makeToast("Wrong password", duration: 1.0, position: .center, style: style)
        }
    }
    
    static func handleRegisterScreen(viewModel:HomeViewModel,view: UIView,text: String) {
        viewModel.openAccountsList()
        viewModel.homeModel.isLogin = true
        viewModel.homeModel.password = text
        view.endEditing(true)
    }
}
