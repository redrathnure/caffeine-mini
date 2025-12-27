/*
    SPDX-FileCopyrightText: 2013 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2025 Maxim Medvedev <redrathnure@gmail.com>

    SPDX-License-Identifier: GPL-2.0-or-later
*/
import QtQuick 2.5
import QtQuick.Controls 2.5
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kquickcontrolsaddons 2.0 as KQuickAddons

Button {
    id: configIcon

    property string defaultValue: ""
    property string value: ""

    implicitWidth: previewFrame.width + PlasmaCore.Units.smallSpacing * 2
    implicitHeight: previewFrame.height + PlasmaCore.Units.smallSpacing * 2

    KQuickAddons.IconDialog {
        id: iconDialog
        onIconNameChanged: configIcon.value = iconName || configIcon.defaultValue
    }

    onPressed: iconMenu.opened ? iconMenu.close() : iconMenu.open()

    PlasmaCore.FrameSvgItem {
        id: previewFrame
        anchors.centerIn: parent
        imagePath: plasmoid.location === PlasmaCore.Types.Vertical || plasmoid.location === PlasmaCore.Types.Horizontal ? "widgets/panel-background" : "widgets/background"
        width: PlasmaCore.Units.iconSizes.large + fixedMargins.left + fixedMargins.right
        height: PlasmaCore.Units.iconSizes.large + fixedMargins.top + fixedMargins.bottom

        PlasmaCore.IconItem {
            anchors.centerIn: parent
            width: PlasmaCore.Units.iconSizes.large
            height: width
            source: configIcon.value
        }
    }

    Menu {
        id: iconMenu

        // Appear below the button
        y: +parent.height

        MenuItem {
            text: i18nc("@item:inmenu Open icon chooser dialog", "Choose...")
            icon.name: "document-open-folder"
            onClicked: iconDialog.open()
        }
        MenuItem {
            text: i18nc("@item:inmenu Reset icon to default", "Clear Icon")
            icon.name: "edit-clear"
            onClicked: configIcon.value = configIcon.defaultValue
        }
    }
}
