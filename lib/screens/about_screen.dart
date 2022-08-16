import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('About'), centerTitle: true, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '    [Pomodoro]  e um gerenciador de tempo para suas tarefas.',
                textAlign: TextAlign.justify,
              ),
              Divider(),
              Text(
                '''   [Pomodoro] é software livre; você pode redistribuí-lo e/ou modificá-lo sob os termos da Licença Pública Geral GNU (GNU General Public License), conforme publicada pela Free Software Foundation; tanto a versão 2 da Licença como (a seu critério) qualquer versão mais nova. \n   O [Pomodoro] é distribuído na expectativa de ser útil, mas SEM QUALQUER GARANTIA; sem mesmo a garantia implícita de COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM PARTICULAR. Consulte a Licença Pública Geral GNU (GNU General Public License) para obter mais detalhes. \n    Você deve ter recebido uma cópia da Licença Pública Geral GNU (GNU General Public License) junto com o [Pomodoro]; caso contrário, escreva para a Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA. ''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontFamily: 'OpenSans'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Criado por Moab Omena \nDesenvolvedor Flutter Full Stack, 2022',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontFamily: 'OpenSans'),
              ),
              Divider(),
              Text(
                'version : ' + _packageInfo.version,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
