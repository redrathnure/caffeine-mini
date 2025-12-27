/*
SPDX-FileCopyrightText: 2013 Marco Martin <mart@kde.org>
SPDX-FileCopyrightText: 2025 Maxim Medvedev <redrathnure@gmail.com>

SPDX-License-Identifier: GPL-2.0-or-later
*/
import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.5 as QQC2
import org.kde.kirigami 2.4 as Kirigami

Item {
    id: page

    property alias cfg_iconActive: configIconActive.value
    property alias cfg_iconInactive: configIconInactive.value

    property alias cfg_execCmd: configExecCmd.text
    property alias cfg_execInterval: configExecInterval.value

    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        ConfigIcon {
            id: configIconActive
            Kirigami.FormData.label: i18n("Icon Active:")
            defaultValue: "caffeine_active_default"
        }
        ConfigIcon {
            id: configIconInactive
            Kirigami.FormData.label: i18n("Icon Inactive:")
            defaultValue: "caffeine_inactive_default"
        }

        QQC2.TextField {
            id: configExecCmd
            readOnly: true
            Kirigami.FormData.label: i18n("Run command:")
        }
        QQC2.SpinBox {
            id: configExecInterval
            Kirigami.FormData.label: i18n("Execution interval (seconds):")
        }
    }
}
