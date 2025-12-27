/*
SPDX-FileCopyrightText: 2013 Marco Martin <mart@kde.org>
SPDX-FileCopyrightText: 2025 Maxim Medvedev <redrathnure@gmail.com>

SPDX-License-Identifier: GPL-2.0-or-later
*/
import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: caffeineMini

    // Execute execCmd every execInterval seconds.
    // execCmd is `plasmoid.configuration.execCmd` + executeCommand()
    // execInterval is `plasmoid.configuration.execInterval` + execInterval
    // The waiting logic is linked to execTimer
    // Status of execution stored into wasActivated
    property int execInterval: Plasmoid.configuration.execInterval

    property bool wasActivated: false

    readonly property bool vertical: plasmoid.formFactor === PlasmaCore.Types.Vertical

    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

    PlasmaCore.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: (source, data) => {
            disconnectSource(source);  // Clean up after execution
        }

        function exec(cmd) {
            connectSource(cmd);
        }
    }

    Plasmoid.compactRepresentation: MouseArea {
        id: compactRoot

        implicitWidth: PlasmaCore.Units.iconSizeHints.panel
        implicitHeight: PlasmaCore.Units.iconSizeHints.panel

        onClicked: wasActivated = !wasActivated

        RowLayout {
            id: iconLabelRow
            anchors.fill: parent
            spacing: 0

            PlasmaCore.IconItem {
                id: buttonIcon

                Layout.fillWidth: caffeineMini.vertical
                Layout.fillHeight: !caffeineMini.vertical
                Layout.preferredWidth: caffeineMini.vertical ? -1 : height / (implicitHeight / implicitWidth)
                Layout.preferredHeight: !caffeineMini.vertical ? -1 : width * (implicitHeight / implicitWidth)
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                source: wasActivated ? plasmoid.configuration.iconActive : plasmoid.configuration.iconInactive
                roundToIconSize: implicitHeight === implicitWidth
            }
        }
    }

    Timer {
        id: execTimer
        interval: execInterval * 1000
        running: wasActivated
        repeat: true
        triggeredOnStart: false

        onTriggered: {
            console.debug("Exec '", plasmoid.configuration.execCmd, "' ...");
            executable.exec("bash -c '" + plasmoid.configuration.execCmd + "'");
        }
    }
}
