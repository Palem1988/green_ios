import Foundation
import UIKit

class KeyboardViewController: UIViewController {
    var keyboardDismissGesture: UIGestureRecognizer?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if keyboardDismissGesture == nil {
            keyboardDismissGesture = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.dismissKeyboard))
            view.addGestureRecognizer(keyboardDismissGesture!)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if keyboardDismissGesture != nil {
            view.removeGestureRecognizer(keyboardDismissGesture!)
            keyboardDismissGesture = nil
        }
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
