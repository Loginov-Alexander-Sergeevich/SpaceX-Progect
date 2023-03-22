import Foundation

// Управляет состоянием нижнего листа
public enum SpaceXRocketLaunchInfoState {
    case initial
    case full
}

// Обозначает общую высоту и начальное смещение нижнего листа.
public struct SpaceXRocketLaunchInfoConfiguration {
    let height: CGFloat
    let initialOffset: CGFloat
}
