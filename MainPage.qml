import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "lancamento.js" as Lancamento

Item {
    GridLayout {
        id: grid
        x: 10
        width: parent.width - 20
        height: 250
        columns: 2
        transformOrigin: Item.Center
        flow: GridLayout.LeftToRight

        DialogAbout {id: dialogAbout }

        Label {
            text: qsTr("Ângulo (°)")
            font.pointSize: 12
        }

        DoubleSpinBox {
            id: spinAngulo
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            value: 3500
            to: 36000
        }

        Label {
            text: qsTr("Velocidade Inicial (m/s)")
            font.pointSize: 12
        }

        DoubleSpinBox {
            id: spinVelocidade
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            value: 4500
        }

        Label {
            text: qsTr("Gravidade (m/s²)")
            font.pointSize: 12
        }

        DoubleSpinBox {
            id: spinAceleracao
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            value: 9800
        }

        Label {
            text: qsTr("Altura (m)")
            font.pointSize: 12
        }

        DoubleSpinBox {
            id: spinAltura
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            value: 76500
        }
    }

    GroupBox {
        id: groupBox
        y: 250
        width: parent.width
        height: 300
        title: qsTr("")

        TextArea {
            id: output
            readOnly: true
            anchors.fill: parent
            placeholderText: "<h2>Relatório</h2>"
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Verdana'; font-size:12pt; font-weight:400; font-style:normal;\">\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>"
            textFormat: Text.RichText
            font.pointSize: 11
            font.family: "Courier New"
            color: "white"

            background: Rectangle {
                anchors.fill: parent;
                color: "black"
                opacity: 0.4
                border.color: "white"
            }
        }
    }

    Button {
        id: calButton
        x: 10
        y: 555
        text: qsTr("Calcular")
        onClicked: showResult();
    }

    Button {
        id: clearButton
        x: 85
        y: 555
        text: qsTr("Limpar")

        onClicked: {
            output.text = "";

            spinVelocidade.value = 0;
            spinAngulo.value = 0;
            spinAceleracao.value = 0;
            spinAltura.value = 0;
        }
    }

    Button {
        id: aboutButton
        x: parent.width - 65
        y: 555
        text: qsTr("Sobre")

        onClicked: dialogAbout.open()
    }

    function showResult() {
        var v = spinVelocidade.realValue;
        var a = Lancamento.toRadian(spinAngulo.realValue);
        var g = spinAceleracao.realValue;
        var h = spinAltura.realValue;

        var alcance  = Lancamento.calcAlcanceMaximo(v, a, g, h)
        var altitude = Lancamento.calcAlturaMaxima(v, a, g, h);
        var tempoVoo = Lancamento.calcTempoVoo(v, a, g, h);
        var compHztl = Lancamento.calcComponenteHorizontal(v, a);
        var compVtcl = Lancamento.calcComponenteVertical(v, a);

        output.text = qsTr("<h2 style='text-align: center'>Relatório</h2>");
        output.text += qsTr("Alcance máximo: %1 metros.").arg(alcance.toLocaleString(Qt.locale("pt_BR")));
        output.text += qsTr("<br>Altitude máxima: %1 metros.").arg(altitude.toLocaleString(Qt.locale("pt_BR")));
        output.text += qsTr("<br>Tempo de voo: %1 segundos.").arg(tempoVoo.toLocaleString(Qt.locale("pt_BR")));
        output.text += qsTr("<br>Componentes da velocidade inicial:");
        output.text += qsTr("<br>Componente horizontal: %1 m/s.").arg(compHztl.toLocaleString(Qt.locale("pt_BR")));
        output.text += qsTr("<br>Componente vertical: %1 m/s.").arg(compVtcl.toLocaleString(Qt.locale("pt_BR")));
    }
}
