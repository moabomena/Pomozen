import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer/custom_drawer.dart';
import 'package:pomodoro_app/widgets/drawer/willpop_callback.dart';

class UseLicenseScreen extends StatefulWidget {
  const UseLicenseScreen({Key? key}) : super(key: key);

  @override
  State<UseLicenseScreen> createState() => _UseLicenseScreenState();
}

class _UseLicenseScreenState extends State<UseLicenseScreen> {
  bool showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            showBackToTopButton = true;
          } else {
            showBackToTopButton = false;
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => willPopCallback(context, 5),
        child: Scaffold(
            floatingActionButton: showBackToTopButton
                ? FloatingActionButton(
                    onPressed: _scrollToTop,
                    child: const Icon(Icons.arrow_upward_rounded),
                  )
                : null,
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Use license'),
              centerTitle: true,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '''LICENÇA PÚBLICA GERAL GNU 
                         Versão 3, 29 de junho de 2007 
            
             Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/> 
             Todos estão autorizados a copiar e distribuir cópias literais 
             deste documento de licença, mas não é permitido alterá-lo permitido. 
            
                              Preâmbulo 
            
              A GNU General Public License é uma licença copyleft gratuita para 
            software e outros tipos de obras. 
            
              As licenças para a maioria dos softwares e outros trabalhos práticos são projetadas 
            para tirar sua liberdade de compartilhar e alterar os trabalhos. Por outro lado, 
            a Licença Pública Geral GNU destina-se a garantir sua liberdade de
            compartilhar e alterar todas as versões de um programa - para garantir que ele permaneça 
            software livre para todos os seus usuários. Nós, a Free Software Foundation, usamos a 
            GNU General Public License para a maioria de nosso software; aplica-se também a 
            qualquer outro trabalho lançado desta forma pelos seus autores. Você também pode aplicá-lo aos 
            seus programas. 
            
              Quando falamos de software livre, estamos nos referindo à liberdade, não ao 
            preço. Nossas Licenças Públicas Gerais são projetadas para garantir que você 
            tenha a liberdade de distribuir cópias de software livre (e cobrar por 
            elas, se desejar), que você receba o código-fonte ou possa obtê-lo se 
            desejar, que você possa alterar o software ou usar pedaços dele em novos 
            programas gratuitos, e que você sabe que pode fazer essas coisas.
            
              Para proteger seus direitos, precisamos impedir que outras pessoas lhe neguem 
            esses direitos ou peçam que você abra mão dos direitos. Portanto, você tem 
            certas responsabilidades se distribuir cópias do software ou se 
            modificá-lo: responsabilidades de respeitar a liberdade dos outros. 
            
              Por exemplo, se você distribuir cópias de um programa desse tipo, seja 
            gratuitamente ou por uma taxa, você deve repassar aos destinatários as mesmas 
            liberdades que recebeu. Você deve certificar-se de que eles também recebam 
            ou possam obter o código-fonte. E você deve mostrar a eles esses termos para que eles 
            conheçam seus direitos. 
            
              Os desenvolvedores que usam a GNU GPL protegem seus direitos com duas etapas: 
            (1) declaram os direitos autorais do software e (2) oferecem a você esta Licença
            dando a você permissão legal para copiá-lo, distribuí-lo e/ou modificá-lo. 
            
              Para proteção dos desenvolvedores e autores, a GPL explica claramente 
            que não há garantia para este software livre. Tanto para os usuários quanto para os 
            autores, a GPL exige que as versões modificadas sejam marcadas como 
            alteradas, para que seus problemas não sejam atribuídos erroneamente a 
            autores de versões anteriores. 
            
              Alguns dispositivos são projetados para negar aos usuários o acesso para instalar ou executar 
            versões modificadas do software dentro deles, embora o fabricante 
            possa fazê-lo. Isso é fundamentalmente incompatível com o objetivo de 
            proteger a liberdade dos usuários de alterar o software. A sistemática
            padrão de tal abuso ocorre na área de produtos para 
            uso individual, que é precisamente onde é mais inaceitável. Portanto, 
            projetamos esta versão da GPL para proibir a prática desses 
            produtos. Se tais problemas surgirem substancialmente em outros domínios, estamos 
            prontos para estender essa provisão a esses domínios em futuras versões 
            da GPL, conforme necessário para proteger a liberdade dos usuários. 
            
              Finalmente, todo programa é constantemente ameaçado por patentes de software. 
            Os Estados não devem permitir que patentes restrinjam o desenvolvimento e uso de 
            software em computadores de uso geral, mas naqueles que o fazem, desejamos 
            evitar o perigo especial de que patentes aplicadas a um programa livre possam
            torná-lo efetivamente proprietário. Para evitar isso, a GPL garante que as 
            patentes não podem ser usadas para tornar o programa não-livre. 
            
              Seguem os termos e condições precisos para cópia, distribuição e 
            modificação. 
            
                         TERMOS E CONDIÇÕES 
            
              0. Definições. 
            
              "Esta Licença" refere-se à versão 3 da GNU General Public License. 
            
              "Copyright" também significa leis semelhantes a direitos autorais que se aplicam a outros tipos de 
            obras, como máscaras semicondutoras. 
            
              "O Programa" refere-se a qualquer trabalho protegido por direitos autorais licenciado sob esta 
            Licença. Cada licenciado é endereçado como "você". "Licenciados" e 
            "destinatários" podem ser indivíduos ou organizações.
            
              "Modificar" um trabalho significa copiar ou adaptar todo ou parte do trabalho 
            de uma forma que exija permissão de direitos autorais, além de fazer uma 
            cópia exata. O trabalho resultante é chamado de "versão modificada" do 
            trabalho anterior ou um trabalho "baseado" no trabalho anterior. 
            
              Um "trabalho coberto" significa o Programa não modificado ou um trabalho baseado 
            no Programa. 
            
              "Propagar" uma obra significa fazer qualquer coisa com ela que, sem 
            permissão, o tornaria direta ou secundariamente responsável por 
            infração sob a lei de direitos autorais aplicável, exceto executá-la em um 
            computador ou modificar uma cópia privada. A propagação inclui cópia, 
            distribuição (com ou sem modificação),
            público e, em alguns países, outras atividades também. 
            
              "Transmitir" uma obra significa qualquer tipo de propagação que permita 
            a terceiros fazer ou receber cópias. A mera interação com um usuário através 
            de uma rede de computadores, sem transferência de uma cópia, não é transmissão. 
            
              Uma interface de usuário interativa exibe "Avisos Legais Apropriados" 
            na medida em que inclui um recurso conveniente e bem visível 
            que (1) exibe um aviso de direitos autorais apropriado e (2) 
            informa ao usuário que não há garantia para o trabalho (exceto para na 
            medida em que as garantias são fornecidas), que os licenciados podem transmitir o 
            trabalho sob esta Licença e como visualizar uma cópia desta Licença. Se
            a interface apresenta uma lista de comandos ou opções do usuário, como um 
            menu, um item de destaque na lista atende a esse critério. 
            
              1. Código Fonte. 
            
              O "código-fonte" de uma obra significa a forma preferida da obra 
            para fazer modificações nela. "Código objeto" significa qualquer forma não-fonte 
            de um trabalho. 
            
              Uma "Interface Padrão" significa uma interface que é um 
            padrão oficial definido por um organismo de padrões reconhecido ou, no caso de 
            interfaces especificadas para uma determinada linguagem de programação, uma que 
            é amplamente utilizada entre os desenvolvedores que trabalham nessa linguagem. 
            
              As "Bibliotecas do Sistema" de um trabalho executável incluem qualquer coisa, 
            exceto o trabalho como um todo,
            empacotar um Componente Principal, mas que não faz parte desse 
            Componente Principal, e (b) serve apenas para permitir o uso do trabalho com esse 
            Componente Principal ou para implementar uma Interface Padrão para a qual uma 
            implementação esteja disponível ao público no código-fonte Formato. Um 
            "Componente Principal", neste contexto, significa um componente essencial principal 
            (kernel, sistema de janelas e assim por diante) do sistema operacional específico 
            (se houver) no qual o trabalho executável é executado, ou um compilador usado para 
            produzir o trabalho, ou um interpretador de código de objeto usado para executá-lo. 
            
              A "Fonte Correspondente" para um trabalho em forma de código objeto significa todo 
            o código fonte necessário para gerar, instalar e (para um executável
            work) executam o código do objeto e modificam o trabalho, incluindo scripts para 
            controlar essas atividades. No entanto, não inclui as 
            Bibliotecas do Sistema do trabalho, nem ferramentas de uso geral ou programas gratuitos geralmente disponíveis 
            que são usados ​​sem modificações na execução dessas atividades, mas 
            que não fazem parte do trabalho. Por exemplo, Corresponding Source 
            inclui arquivos de definição de interface associados a arquivos de origem para 
            o trabalho e o código-fonte para bibliotecas compartilhadas e 
            subprogramas vinculados dinamicamente que o trabalho é projetado especificamente para exigir, 
            como comunicação íntima de dados ou fluxo de controle entre esses 
            subprogramas e outras partes do trabalho.
            
              A Fonte Correspondente não precisa incluir nada que os usuários 
            possam regenerar automaticamente de outras partes da 
            Fonte Correspondente. 
            
              A Fonte Correspondente para um trabalho em forma de código-fonte é o 
            mesmo trabalho. 
            
              2. Permissões básicas. 
            
              Todos os direitos concedidos sob esta Licença são concedidos durante a vigência dos 
            direitos autorais do Programa e são irrevogáveis, desde que as 
            condições declaradas sejam atendidas. Esta Licença afirma explicitamente sua 
            permissão ilimitada para executar o Programa não modificado. O resultado da execução de um 
            trabalho coberto é coberto por esta Licença somente se o resultado, dado seu 
            conteúdo, constituir um trabalho coberto. Esta Licença reconhece a sua
            direitos de uso justo ou outro equivalente, conforme previsto pela lei de direitos autorais. 
            
              Você pode fazer, executar e propagar obras cobertas que você não 
            transmite, sem condições, desde que sua licença permaneça 
            em vigor. Você pode transmitir obras cobertas a outras pessoas com o único propósito 
            de que elas façam modificações exclusivamente para você ou forneçam 
            recursos para executar essas obras, desde que você cumpra 
            os termos desta Licença ao transmitir todo o material sobre o qual você 
            não controla direito autoral. Aqueles que fizerem ou executarem os trabalhos cobertos 
            para você devem fazê-lo exclusivamente em seu nome, sob sua direção 
            e controle, em termos que os proíbam de fazer quaisquer cópias de
            seu material protegido por direitos autorais fora de seu relacionamento com você. 
            
              O transporte sob quaisquer outras circunstâncias é permitido apenas nas 
            condições indicadas abaixo. O sublicenciamento não é permitido; seção 10 
            torna desnecessário. 
            
              3. Protegendo os direitos legais dos usuários da lei antievasão. 
            
              Nenhum trabalho coberto deve ser considerado parte de uma 
            medida tecnológica efetiva sob qualquer lei aplicável que cumpra obrigações sob o artigo 
            11 do tratado de direitos autorais da OMPI adotado em 20 de dezembro de 1996, ou 
            leis semelhantes que proíbam ou restrinjam a evasão de tais 
            medidas. 
            
              Ao transmitir uma obra coberta, você renuncia a qualquer poder legal de proibir
            evasão de medidas tecnológicas na medida em que tal evasão 
            é efetuada pelo exercício de direitos sob esta Licença em relação à 
            obra coberta, e você se isenta de qualquer intenção de limitar a operação ou 
            modificação da obra como meio de impor, contra os 
            usuários da obra, sua ou direitos legais de terceiros para proibir a evasão de 
            medidas tecnológicas. 
            
              4. Envio de cópias literais. 
            
              Você pode transmitir cópias literais do código-fonte do Programa à medida que o 
            recebe, em qualquer meio, desde que 
            publique de forma visível e apropriada em cada cópia um aviso de direitos autorais apropriado; 
            manter intactos todos os avisos informando que esta Licença e qualquer
            termos não permissivos adicionados de acordo com a seção 7 aplicam-se ao código; 
            manter intactos todos os avisos de ausência de qualquer garantia; e dar a todos os 
            destinatários uma cópia desta Licença junto com o Programa. 
            
              Você pode cobrar qualquer preço ou nenhum preço por cada cópia que você transmitir, 
            e você pode oferecer suporte ou proteção de garantia por uma taxa. 
            
              5. Transmitindo Versões de Origem Modificadas. 
            
              Você pode transmitir um trabalho baseado no Programa, ou as modificações para 
            produzi-lo a partir do Programa, na forma de código-fonte nos 
            termos da seção 4, desde que você também atenda a todas estas condições: 
            
                a) O trabalho deve conter avisos informando que você 
                o modificou e fornecendo uma data relevante.
            
                b) O trabalho deve conter avisos proeminentes declarando que foi 
                liberado sob esta Licença e quaisquer condições adicionadas na seção 
                7. Este requisito modifica o requisito na seção 4 para 
                "manter intactos todos os avisos". 
            
                c) Você deve licenciar a obra inteira, como um todo, sob esta 
                Licença para qualquer pessoa que tenha uma cópia. Esta 
                Licença, portanto, se aplicará, juntamente com quaisquer 
                termos adicionais da seção 7 aplicáveis, a toda a obra e todas as suas partes, 
                independentemente de como elas são empacotadas. Esta Licença não dá 
                permissão para licenciar o trabalho de qualquer outra forma, mas não 
                invalida tal permissão se você a tiver recebido separadamente.
            
                d) Caso a obra possua interfaces de usuário interativas, cada uma deverá exibir 
                Avisos Legais Apropriados; no entanto, se o Programa tiver 
                interfaces interativas que não exibem Avisos Legais Apropriados, seu 
                trabalho não precisa fazê-los fazê-lo. 
            
              Uma compilação de uma obra coberta com outras obras separadas e independentes 
            , que não são por sua natureza extensões da obra coberta 
            e que não são combinadas com ela de modo a formar um programa maior, 
            em um volume de armazenamento ou distribuição meio, é chamado de 
            "agregado" se a compilação e seus direitos autorais resultantes não forem 
            usados ​​para limitar o acesso ou os direitos legais dos usuários da compilação
            além do que as obras individuais permitem. A inclusão de uma obra coberta 
            em um agregado não faz com que esta Licença se aplique às outras 
            partes do agregado. 
            
              6. Envio de Formulários Não Originais. 
            
              Você pode transmitir uma obra coberta na forma de código objeto nos termos 
            das seções 4 e 5, desde que você também transmita a 
            Fonte Correspondente legível por máquina nos termos desta Licença, 
            de uma das seguintes maneiras: 
            
                a) Transmitir o código objeto em , ou incorporado em um produto físico 
                (incluindo um meio de distribuição físico), acompanhado pela 
                Fonte Correspondente fixada em um meio físico durável 
                normalmente usado para intercâmbio de software.
            
                b) Transmitir o código-objeto em, ou incorporado em, um produto físico 
                (incluindo um meio de distribuição físico), acompanhado de uma 
                oferta por escrito, válida por pelo menos três anos e válida 
                enquanto você oferecer peças sobressalentes ou suporte ao cliente para esse modelo de produto 
                , para dar a qualquer pessoa que possua o código objeto (1) uma 
                cópia da Fonte Correspondente para todo o software no 
                produto coberto por esta Licença, em um 
                meio físico durável normalmente usado para intercâmbio de software, por um preço não 
                mais do que seu custo razoável de realizar fisicamente esta 
                transmissão de fonte, ou (2) acesso para copiar o
                Fonte correspondente de um servidor de rede sem custo. 
            
                c) Transmitir cópias individuais do código objeto com uma cópia da 
                oferta escrita para fornecer a Fonte Correspondente. Esta 
                alternativa é permitida apenas ocasionalmente e não comercialmente, e 
                somente se você recebeu o código objeto com tal oferta, de acordo 
                com a subseção 6b. 
            
                d) Transmitir o código-objeto oferecendo acesso a partir de um local designado 
                (gratuito ou a custo), e oferecer acesso equivalente à 
                Fonte Correspondente da mesma forma através do mesmo local sem nenhum 
                custo adicional. Você não precisa exigir que os destinatários copiem a 
                Fonte Correspondente junto com o código do objeto. Se o lugar para
                copiar o código do objeto é um servidor de rede, a Fonte Correspondente 
                pode estar em um servidor diferente (operado por você ou por terceiros) 
                que suporte recursos de cópia equivalentes, desde que você mantenha 
                instruções claras ao lado do código do objeto dizendo onde encontrar a 
                Fonte Correspondente . Independentemente do servidor que hospeda a 
                Fonte Correspondente, você permanece obrigado a garantir que ela esteja 
                disponível pelo tempo necessário para atender a esses requisitos. 
            
                e) Transmitir o código-objeto por meio de transmissão ponto a ponto, desde 
                que informe a outros pares onde o código-objeto e 
                a Fonte Correspondente da obra estão sendo oferecidos ao público em geral sem
                cobrança de acordo com a subseção 6d. 
            
              Uma parte separável do código-objeto, cujo código-fonte é excluído 
            da Fonte Correspondente como uma Biblioteca do Sistema, não precisa ser 
            incluída na transmissão do trabalho de código-objeto. 
            
              Um "Produto de usuário" é (1) um "produto de consumo", o que significa qualquer 
            propriedade pessoal tangível que normalmente é usada para fins pessoais, familiares 
            ou domésticos, ou (2) qualquer coisa projetada ou vendida para incorporação 
            em uma residência. Ao determinar se um produto é um produto de consumo, os 
            casos duvidosos serão resolvidos em favor da cobertura. Para um 
            produto específico recebido por um usuário específico, "usado normalmente" refere-se a um 
            uso típico ou comum dessa classe de produto,
            do usuário em particular ou da maneira como o usuário em particular 
            realmente usa, ou espera ou espera que use o produto. Um produto 
            é um produto de consumo, independentemente de o produto ter 
            usos comerciais, industriais ou não-consumidores substanciais, a menos que esses usos representem 
            o único modo significativo de uso do produto. 
            
              "Informações de Instalação" para um Produto do Usuário significa quaisquer métodos, 
            procedimentos, chaves de autorização ou outras informações necessárias para instalar 
            e executar versões modificadas de um trabalho coberto nesse Produto do Usuário a partir de 
            uma versão modificada de sua Fonte Correspondente. As informações devem 
            ser suficientes para garantir que o funcionamento contínuo do objeto modificado
            código não é em nenhum caso impedido ou interferido apenas porque a 
            modificação foi feita. 
            
              Se você transmitir um código de objeto trabalhar sob esta seção em, ou com, ou 
            especificamente para uso em um Produto do Usuário, e a transmissão ocorrer como 
            parte de uma transação na qual o direito de posse e uso do 
            Produto do Usuário é transferido para o destinatário em perpetuidade ou por 
            prazo determinado (independentemente de como se caracterize a operação), a 
            Fonte Correspondente veiculada nesta seção deverá ser acompanhada 
            das Informações de Instalação. Mas este requisito não se aplica 
            se nem você nem terceiros tiverem a capacidade de instalar 
            o código objeto modificado no Produto do Usuário (por exemplo, o trabalho tiver
            foi instalado na ROM). 
            
              O requisito de fornecer Informações de instalação não inclui o 
            requisito de continuar a fornecer serviço de suporte, garantia ou atualizações 
            para um trabalho que foi modificado ou instalado pelo destinatário ou para 
            o Produto do Usuário no qual foi modificado ou instalado. O acesso a uma 
            rede pode ser negado quando a própria modificação 
            afeta material e adversamente a operação da rede ou viola as regras e 
            protocolos de comunicação através da rede. 
            
              A Fonte Correspondente transmitida e as Informações de Instalação fornecidas, 
            de acordo com esta seção, devem estar em um formato documentado publicamente 
            (e com uma implementação disponível ao público em
            código-fonte) e não deve exigir senha ou chave especial para 
            descompactar, ler ou copiar. 
            
              7. Termos Adicionais. 
            
              "Permissões adicionais" são termos que complementam os termos desta 
            Licença, fazendo exceções de uma ou mais de suas condições. 
            Permissões adicionais aplicáveis ​​a todo o Programa devem 
            ser tratadas como se estivessem incluídas nesta Licença, na medida em 
            que sejam válidas de acordo com a lei aplicável. Se as permissões adicionais 
            se aplicarem apenas a parte do Programa, essa parte poderá ser usada separadamente 
            sob essas permissões, mas o Programa inteiro permanece regido por 
            esta Licença sem considerar as permissões adicionais.
            
              Ao transmitir uma cópia de um trabalho coberto, você pode, a seu critério, 
            remover quaisquer permissões adicionais dessa cópia ou de qualquer parte 
            dela. (Permissões adicionais podem ser escritas para exigir sua própria 
            remoção em certos casos quando você modifica o trabalho.) Você pode colocar 
            permissões adicionais em material, adicionado por você a um trabalho coberto, 
            para o qual você tem ou pode conceder permissão de direitos autorais apropriada. 
            
              Não obstante qualquer outra disposição desta Licença, para o material que você 
            adicionar a um trabalho coberto, você pode (se autorizado pelos detentores dos direitos autorais 
            desse material) complementar os termos desta Licença com os termos: 
            
                a) Isenção de garantia ou responsabilidade limitada diferentemente do
                termos das seções 15 e 16 desta Licença; ou 
            
                b) Exigir a preservação de avisos legais razoáveis ​​especificados ou 
                atribuições de autor naquele material ou nos 
                Avisos Legais Apropriados exibidos por obras que o contenham; ou 
            
                c) Proibir a deturpação da origem desse material, ou 
                exigir que as versões modificadas de tal material sejam marcadas de 
                forma razoável como diferente da versão original; ou 
            
                d) Limitar o uso para fins publicitários de nomes de licenciantes ou 
                autores do material; ou 
            
                e) Recusar-se a conceder direitos sob a lei de marcas registradas para uso de alguns 
                nomes comerciais, marcas registradas ou marcas de serviço; ou
            
                f) Exigir indenização dos licenciantes e autores desse 
                material por qualquer pessoa que transmita o material (ou versões modificadas 
                dele) com premissas contratuais de responsabilidade para com o destinatário, por 
                qualquer responsabilidade que essas premissas contratuais imponham diretamente a 
                esses licenciantes e autores. 
            
              Todos os outros termos adicionais não permissivos são considerados " 
            restrições adicionais" dentro do significado da seção 10. Se o Programa como você 
            o recebeu, ou qualquer parte dele, contiver um aviso declarando que ele é 
            regido por esta Licença juntamente com um termo que é uma 
            restrição adicional, você pode remover esse termo. Se um documento de licença contiver
            uma restrição adicional, mas que permita relicenciar ou transmitir sob esta 
            Licença, você pode adicionar a um material de trabalho coberto regido pelos termos 
            desse documento de licença, desde que a restrição adicional 
            não sobreviva a tal relicenciamento ou transmissão. 
            
              Se você adicionar termos a um trabalho coberto de acordo com esta seção, 
            deverá colocar, nos arquivos de origem relevantes, uma declaração dos 
            termos adicionais que se aplicam a esses arquivos ou um aviso indicando 
            onde encontrar os termos aplicáveis. 
            
              Termos adicionais, permissivos ou não permissivos, podem ser declarados na 
            forma de uma licença escrita separadamente ou declarados como exceções; 
            os requisitos acima se aplicam de qualquer maneira. 
            
              8. Rescisão.
            
              Você não pode propagar ou modificar um trabalho coberto, exceto conforme expressamente 
            previsto nesta Licença. Qualquer tentativa de outra forma de propagá-la ou 
            modificá-la é nula e encerrará automaticamente seus direitos sob 
            esta Licença (incluindo quaisquer licenças de patente concedidas sob o terceiro 
            parágrafo da seção 11). 
            
              No entanto, se você cessar todas as violações desta Licença, sua 
            licença de um detentor de direitos autorais específico será restabelecida (a) 
            provisoriamente, a menos e até que o detentor dos direitos autorais rescinda explícita e 
            definitivamente sua licença, e (b) permanentemente, se o detentor dos direitos autorais 
            falhar para notificá-lo da violação por algum meio razoável 
            antes de 60 dias após a cessação.
            
              Além disso, sua licença de um detentor de direitos autorais em particular é 
            restabelecida permanentemente se o detentor de direitos autorais notificar você sobre a 
            violação por algum meio razoável, esta é a primeira vez que você 
            recebe um aviso de violação desta Licença (para qualquer trabalho) desse detentor de 
            direitos autorais, e você corrige a violação antes de 30 dias após 
            o recebimento da notificação. 
            
              A rescisão de seus direitos sob esta seção não encerra as 
            licenças das partes que receberam cópias ou direitos de você sob 
            esta Licença. Se seus direitos foram rescindidos e não 
            restabelecidos permanentemente, você não se qualifica para receber novas licenças para o mesmo 
            material sob a seção 10.
            
              9. Aceitação não necessária para ter cópias. 
            
              Você não é obrigado a aceitar esta Licença para receber ou 
            executar uma cópia do Programa. A propagação auxiliar de uma obra coberta que 
            ocorra exclusivamente como consequência do uso de transmissão ponto a ponto 
            para receber uma cópia também não requer aceitação. No entanto, 
            nada além desta Licença concede a você permissão para propagar ou 
            modificar qualquer trabalho coberto. Essas ações infringem os direitos autorais se você 
            não aceitar esta Licença. Portanto, ao modificar ou propagar um 
            trabalho coberto, você indica sua aceitação desta Licença para fazê-lo. 
            
              10. Licenciamento Automático de Destinatários a Jusante. 
            
              Cada vez que você transmite uma obra coberta, o destinatário automaticamente
            recebe uma licença dos licenciadores originais, para executar, modificar e 
            propagar esse trabalho, sujeito a esta Licença. Você não é responsável 
            por impor a conformidade de terceiros com esta Licença. 
            
              Uma "transação de entidade" é uma transação que transfere o controle de uma 
            organização, ou substancialmente todos os ativos de uma, ou subdivide uma 
            organização, ou funde organizações. Se a propagação de uma obra coberta 
            resultar de uma transação da entidade, cada parte dessa 
            transação que receber uma cópia da obra também recebe quaisquer 
            licenças para a obra que o antecessor da parte em interesse tinha ou poderia 
            dar nos termos do parágrafo anterior, mais o direito de posse do
            Correspondente Fonte do trabalho do antecessor em interesse, se 
            o antecessor o tiver ou puder obtê-lo com esforços razoáveis. 
            
              Você não pode impor outras restrições ao exercício dos 
            direitos concedidos ou afirmados sob esta Licença. Por exemplo, você 
            não pode impor uma taxa de licença, royalties ou outra cobrança pelo exercício dos 
            direitos concedidos sob esta Licença, e você não pode iniciar um litígio 
            (incluindo uma reivindicação cruzada ou reconvenção em uma ação judicial) alegando que 
            qualquer reivindicação de patente foi violada fazendo, usando, vendendo, colocando à 
            venda ou importando o Programa ou qualquer parte dele. 
            
              11. Patentes. 
            
              Um "colaborador" é um detentor de direitos autorais que autoriza o uso sob este
            Licença do Programa ou um trabalho no qual o Programa é baseado. A 
            obra assim licenciada é chamada de "versão de contribuidor" do contribuidor. 
            
              As "reivindicações de patentes essenciais" de um colaborador são todas as reivindicações de patente 
            de propriedade ou controladas pelo colaborador, já adquiridas ou 
            adquiridas posteriormente, que seriam infringidas de alguma forma, permitida 
            por esta Licença, de fazer, usar ou vender sua versão de contribuidor, 
            mas não inclua reivindicações que seriam infringidas apenas como 
            consequência de modificações adicionais da versão do colaborador. Para os 
            propósitos desta definição, "controle" inclui o direito de conceder 
            sublicenças de patentes de maneira consistente com os requisitos 
            desta Licença.
            
              Cada colaborador concede a você uma licença de patente não exclusiva, mundial e isenta de 
            royalties sob as reivindicações essenciais de patente do colaborador, para 
            fazer, usar, vender, colocar à venda, importar e executar, modificar e 
            propagar o conteúdo de sua versão do colaborador. 
            
              Nos três parágrafos seguintes, uma "licença de patente" é qualquer 
            acordo ou compromisso expresso, qualquer que seja a denominação, de não fazer valer uma patente 
            (como uma permissão expressa para praticar uma patente ou acordo para não 
            processar por violação de patente). "Conceder" tal licença de patente a uma 
            parte significa fazer tal acordo ou compromisso de não fazer valer uma 
            patente contra a parte. 
            
              Se você transmitir um trabalho coberto, confiando conscientemente em uma licença de patente,
            e a Fonte Correspondente da obra não estiver disponível para qualquer pessoa 
            copiar, gratuitamente e sob os termos desta Licença, através de um 
            servidor de rede publicamente disponível ou outro meio prontamente acessível, 
            então você deve (1) fazer com que a Fonte Correspondente estar 
            disponível, ou (2) providenciar para se privar do benefício da 
            licença de patente para este trabalho em particular, ou (3) providenciar, de maneira 
            consistente com os requisitos desta Licença, para estender a 
            licença de patente para destinatários downstream. "Confiar conscientemente" significa que você tem 
            conhecimento real de que, exceto para a licença de patente, você está transmitindo o 
            trabalho coberto em um país ou o uso do trabalho coberto por seu destinatário
            em um país, infringiria uma ou mais patentes identificáveis ​​nesse 
            país que você acredita serem válidas. 
            
              Se, de acordo com ou em conexão com uma única transação ou 
            acordo, você transmitir ou propagar através da aquisição de transmissão de uma 
            obra coberta e conceder uma licença de patente a algumas das partes que 
            recebem a obra coberta, autorizando-as a usar, propagar, modificar 
            ou transmitir uma cópia específica do trabalho coberto, a licença de patente 
            que você concede é automaticamente estendida a todos os destinatários do 
            trabalho coberto e dos trabalhos baseados nele. 
            
              Uma licença de patente é "discriminatória" se não incluir no 
            escopo de sua cobertura, proibir o exercício ou for
            condicionado ao não exercício de um ou mais dos direitos que são 
            especificamente concedidos sob esta Licença. Você não pode transmitir um trabalho coberto 
            se for parte de um acordo com um terceiro que esteja 
            no ramo de distribuição de software, sob o qual você faz o pagamento 
            ao terceiro com base na extensão de sua atividade de transmissão 
            do trabalho, e sob a qual o terceiro concede, a qualquer uma das 
            partes que receberiam o trabalho coberto de você, uma 
            licença de patente discriminatória (a) em conexão com cópias do trabalho coberto 
            transmitidas por você (ou cópias feitas dessas cópias), ou ( b) principalmente 
            para e em conexão com produtos específicos ou compilações que
            conter o trabalho coberto, a menos que você tenha feito esse acordo, 
            ou que a licença de patente tenha sido concedida, antes de 28 de março de 2007. 
            
              Nada nesta Licença deve ser interpretado como excluindo ou limitando 
            qualquer licença implícita ou outras defesas a infrações que possam 
            estar disponíveis para você sob a lei de patentes aplicável. 
            
              12. Nenhuma rendição da liberdade dos outros. 
            
              Se forem impostas condições a você (seja por ordem judicial, acordo ou de 
            outra forma) que contradigam as condições desta Licença, elas não 
            o isentam das condições desta Licença. Se você não puder transmitir uma 
            obra coberta de modo a satisfazer simultaneamente suas obrigações sob este
            Licença e quaisquer outras obrigações pertinentes, então, como consequência, você 
            não poderá transmiti-la. Por exemplo, se você concordar com os termos que o obrigam 
            a coletar royalties para posterior transmissão daqueles a quem você transmite 
            o Programa, a única maneira de satisfazer ambos os termos e esta 
            Licença seria abster-se inteiramente de transmitir o Programa. 
            
              13. Use com a Licença Pública Geral GNU Affero. 
            
              Não obstante qualquer outra disposição desta Licença, você tem 
            permissão para vincular ou combinar qualquer trabalho coberto com um trabalho licenciado 
            sob a versão 3 da Licença Pública Geral GNU Affero em um único 
            trabalho combinado e transmitir o trabalho resultante. Os termos deste
            A licença continuará a ser aplicada à parte que é o trabalho coberto, 
            mas os requisitos especiais da Licença Pública Geral GNU Affero, 
            seção 13, relativos à interação através de uma rede se aplicarão à 
            combinação como tal. 
            
              14. Versões Revisadas desta Licença. 
            
              A Free Software Foundation pode publicar versões revisadas e/ou novas da 
            GNU General Public License de tempos em tempos. Essas novas versões serão 
            semelhantes em espírito à versão atual, mas podem diferir em detalhes para 
            resolver novos problemas ou preocupações. 
            
              Cada versão recebe um número de versão distinto. Se o 
            Programa especifica que uma certa versão numerada do GNU General
            A Licença Pública "ou qualquer versão posterior" se aplica a ela, você tem a 
            opção de seguir os termos e condições dessa 
            versão numerada ou de qualquer versão posterior publicada pela Free Software 
            Foundation. Se o Programa não especificar um número de versão da 
            GNU General Public License, você pode escolher qualquer versão já publicada 
            pela Free Software Foundation. 
            
              Se o Programa especificar que um procurador pode decidir quais 
            versões futuras da Licença Pública Geral GNU podem ser usadas, a 
            declaração pública de aceitação de uma versão desse procurador o autoriza permanentemente 
            a escolher essa versão para o Programa. 
            
              Versões de licenças posteriores podem fornecer
            permissões. No entanto, nenhuma obrigação adicional é imposta a qualquer 
            autor ou detentor de direitos autorais como resultado de sua escolha de seguir uma 
            versão posterior. 
            
              15. Renúncia de Garantia. 
            
              NÃO HÁ GARANTIA PARA O PROGRAMA, NA MEDIDA PERMITIDA PELA 
            LEI APLICÁVEL. EXCETO QUANDO INDICADO DE OUTRA FORMA POR ESCRITO, OS DETENTORES DOS DIREITOS 
            AUTORAIS E/OU OUTRAS PARTES FORNECEM O PROGRAMA "COMO ESTÁ" SEM GARANTIA 
            DE QUALQUER TIPO, EXPRESSA OU IMPLÍCITA, INCLUINDO, MAS NÃO SE LIMITANDO A, 
            GARANTIAS IMPLÍCITAS DE COMERCIALIZAÇÃO E ADEQUAÇÃO A UM DETERMINADO 
            FIM . TODO O RISCO QUANTO À QUALIDADE E DESEMPENHO DO PROGRAMA 
            É DE VOCÊ. CASO O PROGRAMA ESTEJA DEFEITUOSO, VOCÊ ASSUME O CUSTO DE
            TODA A MANUTENÇÃO, REPARO OU CORREÇÃO NECESSÁRIA. 
            
              16. Limitação de Responsabilidade. 
            
              EM NENHUMA CIRCUNSTÂNCIA, A MENOS QUE EXIGIDO PELA LEI APLICÁVEL OU ACORDADO POR ESCRITO 
            , QUALQUER TITULAR DOS DIREITOS AUTORAIS, OU QUALQUER OUTRA PARTE QUE MODIFICA E/OU TRANSMITA 
            O PROGRAMA CONFORME PERMITIDO ACIMA, SERÁ RESPONSÁVEL PERANTE VOCÊ POR DANOS, INCLUINDO QUAISQUER QUAISQUER 
            GERAIS, ESPECIAIS, INCIDENTAIS OU CONSEQUENTES DANOS DECORRENTES DO 
            USO OU DA INCAPACIDADE DE USAR O PROGRAMA (INCLUINDO, MAS NÃO SE LIMITANDO À PERDA DE 
            DADOS OU DADOS QUE ESTÃO SENDO IMPRECISOS OU PERDAS SUSTENTADAS POR VOCÊ OU TERCEIROS 
            OU FALHA DO PROGRAMA PARA OPERAR COM OUTROS PROGRAMAS), 
            MESMO QUE TAL TITULAR OU OUTRA PARTE FOI AVISADA DA POSSIBILIDADE DE 
            TAIS DANOS.
            
              17. Interpretação das Seções 15 e 16. 
            
              Se a isenção de garantia e limitação de responsabilidade fornecida 
            acima não puder ter efeito legal local de acordo com seus termos, 
            os tribunais de revisão aplicarão a lei local que mais se aproxima 
            de uma renúncia absoluta de toda responsabilidade civil em conexão com o 
            Programa, a menos que uma garantia ou assunção de responsabilidade acompanhe uma 
            cópia do Programa em troca de uma taxa. 
            
                       FIM DOS TERMOS E CONDIÇÕES 
            
              Como aplicar estes termos aos seus novos programas 
            
              Se você desenvolve um novo programa e deseja que ele seja de maior 
            uso possível para o público, a melhor maneira de conseguir isso é torná-lo
            software livre que todos podem redistribuir e alterar sob estes termos. 
            
              Para isso, anexe os seguintes avisos ao programa. É mais seguro 
            anexá-los ao início de cada arquivo de origem para declarar com mais eficácia 
            a exclusão da garantia; e cada arquivo deve ter pelo menos 
            a linha "copyright" e um ponteiro para onde se encontra o aviso completo. 
            
                <uma linha para dar o nome do programa e uma breve idéia do que ele faz.> 
                Copyright (C) <ano> <nome do autor> 
            
                Este programa é um software livre: você pode redistribuí-lo e/ou modificá 
                -lo nos termos do GNU General Public License conforme publicado pela 
                Free Software Foundation, seja a versão 3 da Licença, ou
                (a seu critério) qualquer versão posterior. 
            
                Este programa é distribuído na esperança de que seja útil, 
                mas SEM QUALQUER GARANTIA; sem mesmo a garantia implícita de 
                COMERCIALIZAÇÃO ou ADEQUAÇÃO A UM DETERMINADO FIM. Veja a 
                Licença Pública Geral GNU para mais detalhes. 
            
                Você deve ter recebido uma cópia da Licença Pública Geral GNU 
                junto com este programa. Caso contrário, consulte <https://www.gnu.org/licenses/>. 
            
            Adicione também informações sobre como entrar em contato com você por correio eletrônico e em papel. 
            
              Se o programa fizer uma interação de terminal, faça com que ele produza um 
            aviso curto como este quando for iniciado em um modo interativo: 
            
                <program> Copyright (C) <year> <name of author>
                Este programa vem com ABSOLUTAMENTE NENHUMA GARANTIA; para detalhes digite `show w'. 
                Este é um software livre, e você pode redistribuí-lo 
                sob certas condições; digite `show c' para detalhes. 
            
            Os comandos hipotéticos `show w' e `show c' devem mostrar as 
            partes apropriadas da Licença Pública Geral. Claro, os comandos do seu programa 
            podem ser diferentes; para uma interface GUI, você usaria uma "caixa sobre". 
            
              Você também deve fazer com que seu empregador (se você trabalhar como programador) ou escola, 
            se houver, assine uma "rejeição de direitos autorais" para o programa, se necessário. 
            Para obter mais informações sobre isso e como aplicar e seguir a GNU GPL, consulte 
            <https://www.gnu.org/licenses/>.
            
              A GNU General Public License não permite incorporar seu programa 
            em programas proprietários. Se o seu programa é uma biblioteca de sub-rotinas, você 
            pode considerar mais útil permitir a vinculação de aplicativos proprietários com 
            a biblioteca. Se é isso que você quer fazer, use a GNU Lesser General 
            Public License em vez desta Licença. Mas primeiro, leia 
            <https://www.gnu.org/licenses/why-not-lgpl.html>.''',
                  textAlign: TextAlign.start,
                ),
              ),
            )));
  }
}
