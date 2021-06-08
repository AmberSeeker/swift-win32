// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

import struct Foundation.TimeInterval

/// An object that represents the presence or movement of a button press on the
/// screen for a particular event.
public class Press {
  internal init(type: Press.PressType, phase: Press.Phase, force: Double,
                timestamp: TimeInterval) {
    self.type = type
    self.phase = phase
    self.force = force
    self.timestamp = timestamp
  }

  // MARK - Getting a Press Object’s Gesture Recognizers

  /// The force of the button press.
  public private(set) var force: Double

  /// The gesture recognizers that are receiving the press.
  public private(set) var gestureRecognizers: [GestureRecognizer]?

  // MARK - Responding to Press Events

  /// A `Responder` object.
  public private(set) var responder: Responder?

  // MARK - Getting the Press’s Location

  /// The window in which the press initially occurred.
  public private(set) var window: Window?

  // MARK - Getting Press Attributes

  /// The key pressed or released on a physical keyboard.
#if false
  public private(set) var key: Key?
#endif

  /// The type of the specified press.
  public private(set) var type: Press.PressType

  /// The current press phase of the object.
  public private(set) var phase: Press.Phase

  /// The time when the press occurred or when it was last mutated.
  public private(set) var timestamp: TimeInterval

  // MARK - Constants

  /// The phases of a button press.
  public enum Phase: Int {
    /// A physical button was pressed.
    case began

    /// A button moved, or the `force` property changed.
    case changed

    /// A button was pressed but hasn’t moved since the previous event.
    case stationary

    /// A button was released.
    case ended

    /// The system canceled tracking for the button.
    case cancelled
  }

  /// Constants that represent buttons that a user can press.
  public enum PressType: Int {
    // MARK - Navigation

    /// A constant that represents the up arrow button.
    case upArrow = 0

    /// A constant that represents the down arrow button.
    case downArrow = 1

    /// A constant that represents the left arrow button.
    case leftArrow = 2

    /// A constant that represents the right arrow button.
    case rightArrow = 3

    /// A constant that represents the page down button.
    case pageDown = 30

    /// A constant that represents the page up button.
    case pageUp = 31

    // MARK - Actions

    /// A constant that represents the play/pause button.
    case playPause = 4

    /// A constant that represents the select button.
    case select = 5

    /// A constant that represents the menu button.
    case menu = 6
  }
}
