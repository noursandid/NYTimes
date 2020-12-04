// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Cancel
  internal static let cancel = L10n.tr("Localizable", "Cancel")
  /// NY Times Most Popular
  internal static let nyTimesMostPopular = L10n.tr("Localizable", "NY_Times_Most_Popular")
  /// Ok
  internal static let ok = L10n.tr("Localizable", "OK")
  /// OOPS
  internal static let oops = L10n.tr("Localizable", "OOPS")
  /// Somethings went wrong!
  internal static let somethingsWentWrong = L10n.tr("Localizable", "Somethings_Went_Wrong!")
  /// Try Again
  internal static let tryAgain = L10n.tr("Localizable", "Try_Again")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
