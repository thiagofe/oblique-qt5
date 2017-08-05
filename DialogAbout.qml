import QtQuick 2.2
import QtQuick.Dialogs 1.1

MessageDialog {
    title: qsTr("Oblique - Lançamento de Projétil")
    icon: StandardIcon.Information
    height: 400

    text: '<br>Oblique calcula alcance, altura e tempo de voo de um projétil.' +
          '<br><br>Esta versão do Oblique foi escrita usando Qt5 e Qt Quick 2.' +
          '<br><br>© 2016-2017 de Thiago Ferreira Santos, orientador: Roberto Colistete Jr.' +
          '<br><br>Software desenvolvido em Projeto de Iniciação Científica na <a href="http://www.ufes.br/"><b> Universidade Federal do Espírito Santo</b></a>.' +
          '<br><br>Free & Open Source: ' +
          '<a href="http://www.gnu.org/licenses/lgpl-3.0.html"><b>License LGPLv3</b></a>' +
          '<br><br>Para mais informações, consulte:' +
          '<a href="https://github.com/thiagosaturno/oblique-qt5"><b> github.com/thiagosaturno/oblique-qt5</b></a>' +
          '<br><br><font color="gray"></font>'
}

