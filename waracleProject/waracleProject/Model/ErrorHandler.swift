//
//  ErrorHandler.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import UIKit

protocol ErrorHandler {
    func handleError(_ error: Error)
}

extension ErrorHandler where Self: UIViewController {
    func handleError(_ error: Error) {
        let vc = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        vc.addAction(okAction)
        present(vc, animated: true)
    }
}

public enum CustomError: Error {
    case decodeError
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodeError:  return "Error decoding data. Please try again."
        }
    }
}
