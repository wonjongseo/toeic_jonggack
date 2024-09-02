import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';

List<Map<String, dynamic>> toeciGrammarTexts = [
  {
    "title": '「文」には必ず「主語」と「動詞」が含まれている',
    "cosi": 'まずは「文」とは何かを理解しよう！',
    "accentContent": '★「文」には必ず「主語」と「動詞」が含まれている。',
    "content": Text.rich(
      TextSpan(
        text: """

こういってしまうと当たり前なのですが、文には必ず「主語」と「動詞」が含まれています。文の基本は1つの主語につき1つの動詞です。逆に言うと、
""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '「主語」または「動詞」がない文というのは許されません',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

例えば、

I play tennis everyday .（私は毎日テニスをします。）

という文で見ると、I（私）が主語で play（します）が動詞となります。

TOEICの文法問題では、

I _______ tennis everyday.

のように文の一部が空欄になっていて、そこに入るべき語句を4つの選択肢の中から1つだけ選ぶという形式です。

ですから、この文の場合は「あ、この文には動詞がないな。じゃあ選択肢からは動詞を選べばいいんだな。」と考えればいいわけです。簡単ですね。""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '「自動詞」の後には「前置詞」、「他動詞」の後には「名詞系」',
    "cosi": '動詞から解答を導き出す。',
    "accentContent": '★「自動詞」のスグ後には「前置詞」、「他動詞」のスグ後には「名詞系」',
    "content": Text.rich(
      TextSpan(
        text: """

I play tennis everyday.（私は毎日テニスをします）

前項で確認したとおり、この文の「動詞」はplay（します）です。
playの直後にtennis（テニス）という名詞が続いていますね。
このtennis（テニス）をplay（します）の「目的語」といいます。

例えば、日本語で「私はします」といっても、「何を」するのかがよく分りませんね。
この場合、動詞「play」（します）の後に名詞「tennis」（テニス）が続くことによって初めて文が成り立っています。つまり、動詞に続く「何を」にあたる語が目的語というわけです。

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '目的語は必ず名詞（名詞節・名詞句・代名詞も含む）です。',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

しかし、実は、動詞にはスグ後に目的語を続けられるものと、続けてはいけないものがあるのです。この区別は語によって決まっているので、それぞれの動詞の用法を覚えなければいけません。

例えば、

I live in Tokyo.（私は東京に住んでいます。）

という文ではlive（住んでいる）が動詞です。
日本語で「私は住んでいます」といったらやはり「どこ？」というのが抜けているので意味がよく分からないですよね。ここでは「どこ？」が「Tokyo」（東京）ですが、

I live Tokyo.

ではダメなのです。英語の文としては成立しません。
なぜかというと「live」はスグ後に目的語を続けてはいけない語だからです。
動詞「live」（住んでいる）に「どこ？」である「Tokyo」を続けたい場合はliveのスグ後に「in」という語をつなげることによって文として成立します。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '自動詞＋前置詞＝他動詞',
    "cosi": '',
    "accentContent": '自動詞＋前置詞＝他動詞',
    "content": Text.rich(
      TextSpan(
        text: """
「文が成立する」というのは、

1．主語があること。
2．動詞の用法が正しい。（前置詞を伴う必要があるのか、目的語をとるのか。）
3．その他の文法用法が適切。

と考えればよいです。ここでは1の「主語があること。」と2の「動詞の用法が正しい。」をおさえてください。その他の文法については後で学習していきます。

playのようにスグ後に目的語を続けられる動詞のことを「他動詞」といい、liveのようにスグ後に目的語を続けてはいけない動詞のことを「自動詞」といいます。

自動詞は「in」「at」「from」「with」などの前置詞をスグ後に続けることによって、他動詞と同じく後に目的語を続けることが可能となります。

この用法を公式的に言いますと、

自動詞＋前置詞＝他動詞

となります。他動詞のスグ後には前置詞は続きませんし、自動詞のスグ後には名詞が続かないのです。逆に言うと、肯定文で動詞が他動詞または自動詞＋前置詞なら目的語をとらなければ文として成立しません。

自動詞がどんな前置詞を続けるかは、それぞれの動詞によって違ってきますし、また、どんな意味にしたいかによっても違ってきます。また、語によっては自動詞と他動詞の両方の役割ができるものもあります。TOEIC対策としてはとりあえず次ページのものを覚えましょう。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '自動詞と目的語の間には前置詞',
    "cosi": 'TOEIC英文法問題にでやすい自動詞用法',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
arrive （到着する）
disappear （消える・いなくなる）
happen （生じる）,
look （～のように見える）
remain（～のままである）

ちなみに、
""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '自動詞は受動態では使われません。',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
受動態とは「～される」という受身の用法です。「～する」という普通の文は能動態といいます。受動態については、詳しくは後の項でやりますね。

I arrived in New York yesterday.（私は昨日ニューヨークに着いた。）

He will arrive at airport at 3 o’clock.（彼は3時に空港に着く予定です。）

She disappeared suddenly.（彼女は突然いなくなった。）

An accident happened in the building.（そのビルの中である事故が起こった。）

He looks poor.（彼はみずぼらしくみえる。）

The door remained open.（そのドアは開いたままだった。）

目的語（名詞）をとっている場合は自動詞の後ろにちゃんと前置詞がありますね。自動詞の後ろに形容詞や副詞がきている文には前置詞はありません。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '能動態の文では、他動詞の直後に前置詞はこない',
    "cosi": 'TOEIC英文法問題にでやすい他動詞用法',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
assure （～だと確約する・保証する）
discuss（～について議論する）
resemble（～に似ている）
mention（～について言及する）
reach（～に到着する）
regret（～を後悔する）
cancel（～をキャンセルする）
exceed（～を超過する）
visit（～を訪れる）
marry（～と結婚する）
approach（～に近づく）
address （～に宛名を書く
enter（～に入場する）
answer（～に答える）
disclose（～を露わにする）
announce（～を発表する）
join（～に参加する）

I assure you that he will win the race.
（私は彼がそのレースに勝つとあなたに保証します。）

I’ll discuss the project with her tomorrow.
（私は明日彼女とそのプロジェクトについて話し合う。）

He mentioned the novel.（彼はその小説について語った。）

He reached the bus stop.（彼はそのバス停に到着した。）

She regretted her own behavior.（彼女は自分自身のふるまいをくやんだ。）

He canceled his order for the ticket.（彼はそのチケットの注文をキャンセルした。）

Our success exceed our hope.（期待以上にうまくいった。）

I visited Kyoto.（私は京都を訪れた。）

He visited his uncle.（彼は彼のおじを訪ねた。）

He will marry her next month.（彼は来月彼女と結婚する予定だ。）

She approached the wall.（彼女はその壁に近づいた。）

I addressed a parcel.（私は小包に宛名を書いた。）

He entered the room.（彼はその部屋に入った。）

She didn’t answer his question.（彼女は彼の質問に答えなかった。）

He disclosed his secret.（彼は彼の秘密を明らかにした。）

She announced her engagement.（彼女は婚約を発表した。）

He joined a tennis club.（彼はテニスクラブに加入した。）

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★能動態の文では、他動詞の直後に前置詞はこない',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

能動態の文では、他動詞の直後に前置詞がくっつくことはありません。
が、他動詞が受動態のときは前置詞がつきます。

例）

He has been married with her for five years.（彼は彼女と結婚して5年になる）

TOEIC文法問題では、自動詞と他動詞の区別を知っているだけで解ける問題は山ほどあります。

I play _______ everyday.

という問題があったとしたら、「あ、playは目的語をスグ後に続けられる語だから空欄には名詞がくるなんだな」と判断し、選択肢の中から名詞を選べばいいのです。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '副詞は無視',
    "cosi": '',
    "accentContent": '★文の構成要素としては、副詞は無視していい',
    "content": Text.rich(
      TextSpan(
        text: """
ここで｢副詞｣についても少々チェックしておきましょう。

先ほどの説明で「スグ後」という表現を多く使ったのですが、「副詞」は状況によっては、動詞の直前や直後など、文の様々な場所に入り込んできます。

副詞は文の意味上のニュアンスを表現するためだけのもので、文法的に「文」として成立する為に必ずしも必要なものではありません。
""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '文法的には、副詞は文の中にあってもいいし、なくてもよい',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
のです。すなわち、
""",
              ),
              TextSpan(
                text: '文の構成要素としては、副詞は無視していい',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
ということです。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '冠詞直後の空欄は名詞',
    "cosi": '',
    "accentContent": '★冠詞直後の空欄は名詞。',
    "content": Text.rich(
      TextSpan(
        text: """
「名詞」もチェックしておきましょう。「名詞」というのは「人」や「物」の名前のことです。一般的な総称・呼び方も含みます。「Mike」（マイク：人の名前）とか「book」（本）とか「stone」（石）とか「river」（川）とかintroduction（紹介）とか。

基本的にひとつしかないものを「固有名詞」というのですが（Mikeは固有名詞です）、固有名詞以外の名詞は文の中で使われるとき、前にたいてい「冠詞」がつきます。

冠詞というのは「the」とか「a」のことです。「a」は名詞が単数形のときだけ使います。逆に、空欄の直前に冠詞がある場合は、空欄の直後（または2～3語くらい）は名詞です。
たとえば、

I am a _______ .

Ａ）refuse
Ｂ）postpone
Ｃ）student
Ｄ）suddenly

という問題があったら、「空欄の直前が冠詞か。ということは、空欄は名詞だな。」ということでＣのstudent（生徒）を選ぶことができます。TOEICでは空欄の前後の形を確認するだけで解ける問題が出題でされることがあります。もしくは選択肢で「確実にコレは消しだな」と絞れる問題が多くありますので、そういう問題がでたら、とりこぼさないようにこころがけましょう。

なお、その他の選択肢の語の意味はrefuse（自他動詞：断る）、postpone（他動詞：延期する）、suddenly（副詞：突然に）です。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '冠詞と名詞に挟まれた空欄は形容詞',
    "cosi": '',
    "accentContent": '★冠詞と名詞に挟まれた空欄は形容詞',
    "content": Text.rich(
      TextSpan(
        text: """
「形容詞」は名詞の説明をするものです。「new book」（新しい本）といったら、bookという名詞の説明をしているnewが形容詞です。

このように形容詞は名詞の説明をするのですが、その他に「補語」にもなります。これについては後で説明します。

ちなみに、

This is a _______ clock.

Ａ）function
Ｂ）cereal
Ｃ）unload
Ｄ）old

という問題なら、「空欄の直前が冠詞だから、その直後は名詞（名詞節・名詞句・代名詞も含む）になる。空欄の直後がclockという名詞だから、空欄とclockで名詞句を形成しているんだな。じゃあ空欄には名詞の説明をする形容詞がはいる。」と考え、Ｄのold（形容詞：古い）を選ぶことができます。

なお、選択肢の語の意味はfunction（名詞：機能）、cereal（名詞：穀物）、unload（自他動詞：荷をおろす）です。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '文が成り立っているなら、空欄は副詞か形容詞',
    "cosi": '',
    "accentContent": '★文が成り立っているなら、空欄は副詞か形容詞',
    "content": Text.rich(
      TextSpan(
        text: """
ここで、副詞についても先ほどの例文を考えてみましょう。

I play tennis everyday.（私は毎日テニスをします。）

でいうと、everyday（毎日）が副詞です。ですから、

I play tennis.（私はテニスをします。）

でも文法的には問題なく成立します。さっき言った通り、副詞があるとか無いとかは文の成立には無関係ですから問題ないんですね。

I play tennis　_____________ .

Ａ）everyday
Ｂ）every
Ｃ）introduction
Ｄ）put

という問題があったとしたら「主語はあるし動詞は他動詞で目的語もあるからI play tennisだけで文は成立している。なら、空欄には副詞だな」と考え、Ａのeverydayを選ぶことができます。

なお、選択肢の語の意味は、every（形容詞：全ての）、introduction（名詞：紹介）、put（他動詞：置く）です。

この他に、形容詞があってもなくてもいい場合もあります。

副詞の位置は、文頭か文末であることが多く、形容詞は文中のことが多いので、こういった視点からも正解を導き出す手がかりが得られます。たとえば、文が成り立っていて、文中に空欄があれば、形容詞の可能性が高いといえるでしょう。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '「不足」を見極める',
    "cosi": '',
    "accentContent": '★「不足」を見極める',
    "content": Text.rich(
      TextSpan(
        text: """
今度は自動詞についてです。

I live.（私は住んでいます。）

だけでも「どこ？」は抜けているのですが、文法上の文としては一応成立しています。
自動詞は目的語を続けたい場合だけ前置詞を伴えばいいのです。

ここまでをおおまかにまとめますと、

他動詞は能動態のときは後に目的語が続かなければならない。
自動詞は後に目的語を続けなくてもよい。目的語を続けたい場合は前置詞が必要。
文の中には副詞はあってもなくてもいい。

です。

TOEIC文法問題の基本的な考え方は、

1．文法上の文として成立していないので、空欄には文法上不足しているものが入る。
2．文法上の文として成立しているので、空欄には文法上あってもなくてもいい意味を補足する語（形容詞や副詞）が入る。

の2パターンだけです。

文法上の文として成立しているかいないかは、ほとんど、主語と動詞を確認すれば事足ります。主語がなければ、主語ができるように空欄を埋めればいいですし、動詞が他動詞でその直後が空欄なら目的語になるように空欄を埋めればいいですし、主語も他動詞も目的語もあって文として成立しているのなら、意味上の補足をするように形容詞や副詞などで空欄を埋めればいいということになるのです。要は、文の構成要素に不足があるかないかに注目するということ、なのです。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '物か人か、選ぶ',
    "cosi": '',
    "accentContent": '★物か人か、選ぶ',
    "content": Text.rich(
      TextSpan(
        text: """
他動詞には目的語を2つとるものがあります。例えば、

She gave me the pencil.（彼女は私にそのエンピツをくれた。）

では「gave」が動詞、「me」と「the pencil」の2つが目的語です。
「gave」は「give」の過去形ですね。giveは目的語を2つとれる動詞です。
2つの目的語をとることができる他動詞の場合、目的語の1つ目はたいてい「～に」の意味で「人」、2つ目はたいてい「～を」の意味で「物」です。

ところで、2つの目的語をとることができる他動詞がでてきたら目的語が2つないと文が成立しないのかというと、必ずしもそうではありません。

She gave the pencil to me. （彼女は私にそのエンピツをくれた。）

この文では、「gave」が動詞、「the pencil」が目的語、「to me」は意味を補足する前置詞句です。このように「～を」の方の目的語1つだけにした場合は「～に」の方は前置詞句で言い換えることが可能です。

She gave me .

とあったら、「gaveは目的語を2つとれる動詞。動詞直後の目的語の一つ目にmeという「人」がきているから、空欄にはもうひとつ目的語が名詞（名詞節・名詞句・代名詞も含む）（たぶん「物」）で入るんだな。」と考えればいいわけです。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": 'イコールの関係',
    "cosi": '■「＝（イコール）」の意味の動詞',
    "accentContent": '★イコールの関係',
    "content": Text.rich(
      TextSpan(
        text: """
be動詞。am , is , are ですね。これらは基本的にイコールを意味すると考えて差し支えありません。

I am a student.（私は生徒です。）

この文では、I（私）とa student(生徒)がイコールの関係です。studentは名詞ですね。

She is nice.（彼女はステキだ。）

この文ではShe（彼女）とnice（ステキ）がイコールの関係です。niceは形容詞です。

このようにbe動詞は主語と「何か」をイコールで結ぶことができます。
その「何か」は名詞か形容詞か前置詞句です。

イコールの関係を表す動詞はbe動詞だけではありません。例えば、

He looks happy.（彼は幸せそうだ。）

の文でみるとHeとhappyはイコールの関係です。

He is happy.（彼は幸せだ。）
He looks happy.（彼は幸せそうだ。）

この2つの文を見比べると、よく似ていますね。isとlook両方ともHeとhappyをイコールの関係で結んでいます。このlookは「be動詞に意味上のニュアンスをちょっとだけ加えたもの」と理解してください。

ちなみに、人間の5感に関連したような動詞は知覚動詞と呼ばれます。

主語と「何か」をイコールの関係で結ぶことのできる知覚動詞には、
appear , look , seem （～のようだ）、feel（～の感じがする）、smell（～の匂いがする）、sound（～に聞こえる）、taste（～の味がする）などがあります。

She appears sad.（彼女は悲しそうだ。）

He looks pale.（彼は顔色が悪くみえる。）

She seems young.（彼女は若くみえる。）

I feel hungry.（おなかがすいた。）

It smells good.（それはいいにおいがする。）
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '意味を取る',
    "cosi": '',
    "accentContent": '★意味を取る',
    "content": Text.rich(
      TextSpan(
        text: """
be動詞や知覚動詞などで主語とイコールの関係で結ばれた語を「補語」といいます。

I am a student.（私は生徒です。）

She is nice.（彼女はステキだ。）

でいうと、studentやniceが補語です。

主語と補語をイコールで結ぶことのできる動詞は他にもあります。

become , come , get ,go , grow , keep , make , prove , stay , stand , remain , turn
などです。

これらも主語と補語をイコールで結びつけつつ、動詞のもつニュアンスが加わっています。

He became rich.（彼は金持ちになった。）（He＝richの関係）

Dreams come true.（夢はかなう。）（Dream＝trueの関係）

Human being gets old.（人間は年をとる。）（Human being＝oldの関係）

He went crazy.（彼は気が狂った。）（He＝crazyの関係）

It was growing cold.（しだいに寒くなっていった。）（It＝coldの関係）

The soup kept warm.（そのスープは温かいままだった。）（The soup＝warmの関係）

She will make a good wife for him.
（彼女は彼のよい妻になるだろう。）（She＝a good wifeの関係）

It proved true.（それは本当だと判明した。）（It＝trueの関係）
★：意味を取る

She stayed calm.（彼女は落ち着いたままでいた。）（She=calmの関係）

The door stood open.（そのドアは開いたままだった。）（The door＝openの関係）

The sky remained clear.（空は晴れたままだった。）（The sky＝clearの関係）

The traffic signal turned red.（信号機が赤にかわった。）（The traffic signal＝redの関係）

このような「～になる」や「～の状態である」といったニュアンスの動詞が主語と補語をイコールで結ぶ動詞に多く見受けられますので覚えておきましょう。ちなみにこれらの分類は自動詞になります。ですから、

The sky remained _______.

Ａ）a student
Ｂ）clear
Ｃ）rich
Ｄ）a good wife

という問題があったら、「remainは主語と補語をイコールで結ぶ動詞。ということは空欄には名詞か形容詞か前置詞句だな。でも選択肢は全部名詞か形容詞か。主語The skyとイコールで意味的におかしくないのは・・・clearだ。」というふうに考えることができます。

TOEICには動詞の用法・選択肢の品詞を判断するだけで解ける問題もありますが、この問題のように意味を考えなければいけないものが多いので、普段からたくさん英文を聞いて読んでボキャブラリーを増やすようにしましょう。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '目的語と補語のイコール',
    "cosi": '目的語と補語を同時にとり、その2つをイコールの関係で結ぶことができる動詞',
    "accentContent": '★目的語と補語のイコール',
    "content": Text.rich(
      TextSpan(
        text: """
長い説明で申し訳ないのですが、「目的語と補語を同時にとり、その2つをイコールの関係で結ぶことができる動詞」というものがあります。例文をみてみましょう。

I found the book interesting.（その本は面白いとわかった。）

この文の動詞はfindの過去形「found」、目的語はthe book、補語がinterestingです。
findは「目的語と補語を同時にとり、その2つをイコールの関係で結ぶことができる動詞」です。ですから、目的語the bookと補語interestingはイコールの関係です。

「目的語と補語を同時にとり、その2つをイコールの関係で結ぶことができる動詞」は、主に以下のようなものがありますが、この他にもありますので学習の中で出会ったらできるだけ覚えるようにしましょう。

keep , leave, call , name , feel ,think , consider , paint , like など。

The storm kept me in the building.
（嵐のせいで私はビルの中からでられなかった。）（me＝in the buildingの関係）

She left the door open.（彼女はドアを開けっ放しにした。）（the door＝openの関係）

You can call me Mike.（マイクってよんで。）（me＝Mikeの関係）

They named their daughter Nancy.
（彼らは彼らの娘をナンシーと名づけた。）（their daughter＝Nancyの関係）

I felt it strange.（私はそれを奇妙だと感じた。）（it＝strangeの関係）

I think him clever.（私は彼を賢いと思っている。）（him＝cleverの関係）

He considers himself unlucky.
（彼は彼自身を運が悪いと思っている。）（himself＝unluckyの関係）

He painted the wall blue.（彼はその壁を青く塗った。）（the wall＝blueの関係）

I like my coffee strong.（私はコーヒーは濃いのが好きです。）（my coffee＝strongの関係）

ですので例えば、

He _______ the wall blue.

Ａ）often
Ｂ）between
Ｃ）is
Ｄ）painted
という問題があったら、「動詞がないから空欄には動詞がはいる。選択肢の中で動詞はisとpainted。空欄の後は名詞と形容詞だから、その2つをイコールで結べるpaintedが適切だ。」と考えることができます。

選択肢の語の意味は、often（副詞：しばしば）、between（前置詞：between Ａ and Ｂで、ＡとＢのあいだに）。

一般的な参考書ではここまでを「5文型」ということで説明するのですが、敢えて今回はその言葉を使いませんでした。「第3文型はこういう形」と覚えることにあまり意味はないと思いますし、要するに「動詞」がどんなものであるかによって文がどのような形で成立するのかが決定されるのですから、動詞の用法ということに意識をおいて学習したほうがよいと思ったからです。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '動詞が動詞を連れてくる',
    "cosi": '動詞＋目的語＋動詞の原形（または現在分詞・過去分詞）',
    "accentContent": '★動詞が動詞を連れてくる',
    "content": Text.rich(
      TextSpan(
        text: """
「文」とは主語1つ、動詞1つが基本です。なのですが、
動詞の後に目的語、その次に動詞の原形（または現在分詞・過去分詞）をとる用法を持つ動詞があります。

make , let , have , see , hear , feel , watch , noticeなどです。

それぞれ用法が多少異なります。例文をみてみましょう。

He made his children clean the room.（彼は彼の子供たちにその部屋を掃除させた。）

主語はHe、動詞がmakeの過去形のmade、目的語がhis children。
なぜその後に動詞の原形cleanとさらにthe roomが続いているのでしょうか。

makeには動詞の原形を伴って「目的語に～させる」という用法があります。ということは、

He made his children _______ the room.

Ａ）clean
Ｂ）cleaned
Ｃ）cleaning
Ｄ）cleanness

という問題があったら「あ、動詞の原形だな」ということで、正解肢のＡを選ぶことができます。""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: 'madeが過去形だからといってＢを選んではいけません。',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
makeが伴うのは
動詞の原形だけです。分詞（～ingや～edなど）は伴いません。ただし、makeが受動態で使われたときはto不定詞を伴います。

例文）

His children were made to clean the room（by him）.
（彼の子供たちは（彼に）その部屋を掃除させられた）
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '動詞の主語を見極める',
    "cosi": '',
    "accentContent": '★動詞の主語を見極める',
    "content": Text.rich(
      TextSpan(
        text: """
前項と同じ文ですが、もう一度。

He made his children clean the room.（彼は彼の子供たちにその部屋を掃除させた。）

「文」には主語1つにつき動詞1つが基本で、この文の主語はHe、動詞はmadeなのですが、「動詞＋目的語＋動詞の原形（または現在分詞・過去分詞）」の場合は""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '目的語が動詞の原形の意味上の主語になります。',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text:
                    """ややこしいので言い換えますと、clean（掃除する）のはHeではなくhis childrenであるということです。しっかり理解しましょう。

ちなみにこのmakeの動詞の原形を伴って「目的語に～させる」という用法は「強制的に～させる」というニュアンスです。このことは知らなくてもTOEICの文法問題には対応できますが、できれば覚えておきましょう。

He didn’t let us smoke there.（彼はそこで私たちにタバコを吸わせなかった。）

letも「目的語に～させる」といった意味で使うことができますが「許可」のニュアンスを含んでいます。過去形の文章ですが、やはりsmokeは動詞の原形になっていますね。
letも伴うのは動詞の原形のみです。letは受動態では使わないと考えて差し支えありません。

haveも目的語と動詞の原形を伴い「～させる」という使い方ができるのですが、ニュアンスは｢～してもらう｣です。また、makeやletと違い動詞の原形部分を現在分詞や過去分詞に置き換える用法もあるので注意が必要です。

She had him open the door.（彼女は彼にドアを開けてもらった。）

これはopenという動詞の原形を伴ったパターンです。openの意味上の主語はhimです。「彼」が「ドアを開けた」という関係であることをご確認ください。

I had my hair cut.（私は髪を切ってもらった。）

この文のcutは過去分詞です。cutは現在形、過去形、過去分詞が全て同じ形なので注意が必要ですね。過去分詞を使った場合は「～される」という受動的な意味になりますから、cutの意味上の主語はmy hairで、「髪」が「切られた」という関係です。

TOEICでは現在形→過去形→過去分詞の変化が特殊な動詞を、このように他の動詞の用法とからませてよく出題しますので、組み合わせた考え方ができるようにしましょう。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '「する」のか、「される」のか',
    "cosi": '',
    "accentContent": '★「する」のか、「される」のか',
    "content": Text.rich(
      TextSpan(
        text: """
ひとつのコツとしては、目的語が「人」か「物」かに注目することです。""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '「物」は能動的に何かを「する」ということはない',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """と考えられますので、必然的に「～される」という受動的な意味が導かれます。例えば、

I had my hair _______ .

こうなっていたら、「目的語はmy hairという「物」か。じゃあ空欄には過去分詞だ。」というふうにスっと答えることができます。（実は、「物」が文の主語になり、動詞が能動的に使われる場合もありますが、「物」が目的語として使われている場合は気にしなくても大丈夫です）

さらにhaveには現在分詞を伴う用法もあります。

He had her laughing.（彼は彼女を笑わせた。）

haveの用法はこれらの3つどれも覚えておく必要がありますが、一般的に過去分詞を使う形が多いですし、TOEICでも過去分詞を使った形が出題されやすいと言えます。

see , hear , feel , watch , noticeは知覚動詞です。これらの語も「動詞＋目的語＋動詞の原形（または現在分詞・過去分詞）」の用法があります。

I saw her cry.（私は彼女が泣くのをみた。）

I saw her crying.（私は彼女が泣いているのをみた。）

I saw her killed.（私は彼女が殺されるのをみた。）

一応ですが上の2つのニュアンスの違いは、動詞の原形（cry）の方は「泣いているのを最初から最後までみた」で、現在分詞（crying）のほうは「泣いている最中の一部をみた」といった感じです。現在分詞（crying）のほうは「動作」というニュアンスといったほうが分りやすいかもしれません。過去分詞の例（killed）は目的語herがkilled（殺される）の受け身の関係です。

I heard him go out.（私は彼がでていくのが聞こえた。）

I heard him going out. （私は彼がでていっているのが聞こえた。）

hearに関しては過去分詞の用法は考えなくてもいいです（一応可能なんですが、あまり使われないので）。

I felt my heart beat.（私は心臓が鼓動するのを感じた。）

I felt my heart beating.（私は心臓が鼓動しているのを感じた。）

I felt my arm broken.（私は腕を折られるのを感じた。）

I watched him enter the room.（私は彼が部屋に入るのをみた。）

I watched him entering the room.（私は彼が部屋に入っていっているのをみた。）

I noticed her laugh.（私は彼女が笑うのに気づいた。）

I noticed her laughing.（私は彼女が笑っているのに気づいた。）

厳密に言うとwatchとnoticeには過去分詞の用法はないのですが、そのように細かく覚えるよりも、知覚動詞はこういった用法があると大雑把に覚えておくだけで十分です。

TOEIC対策としては、目的語との関係（する・される）を意識して考えさせる形式ででますので細かいことは気にしないほうがいいでしょう。また、この用法で選択肢に動詞の原形と現在分詞が両方はいっているような判断不能な問題はでないと思いますのでご安心ください（ないとは思いますが万が一出題されたら前後の意味から考えましょう）。""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '助動詞の後の動詞は原形',
    "cosi": '助動詞',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """助動詞とは、動詞の前について動詞の働きをサポートするものです。主に、

can（～できる・～してもよい），must（～しなければならない），
may（～するかもしれない・～してもよい），
will（～する予定である・～するつもりだ），shall（～だろう），
do（後で説明しますが、疑問文をつくったり、否定文をつくったりします）

などがあります。鉄則として、

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★助動詞の後の動詞は原形',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
です。

当たり前と言えば当たり前ですが、これだけで解ける問題が出題されることも珍しくありません。

canは主に「～できる」という可能の意味で使われます。

I can swim.（私は泳げる。）

また、「～してもよい」という許可の意味でも使われます。

You can use my mobile phone.（私の携帯電話を使ってもいいですよ。）

例えば、

You can my mobile phone.

という問題があったら、「助動詞の後には動詞の原形だ。」と秒殺できます。

次の文はmustの「～しなければならない」という意味での例文です。

You must study English.（あなたは英語を勉強しなければならない。）

mustでの否定文は禁止を意味します。

You must not smoke here.（あなたはここでタバコを吸ってはならない。）""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '助動詞は１つの文に１つ',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """mayは「～するかもしれない」という推量を意味します。

You may be wrong.（あなたは間違っているかもしれない。）

また、許可の意味もあります。canの「～してもよい」はくだけた言い方で、かしこまった言い方での「～してもよい」はmayです。

You may use my mobile phone.（私の携帯電話を使ってもいいですよ。）

willは未来を表します。

He will be back in two weeks.（彼は2週間後に戻ってくる予定です。）

I will go to school by bus tomorrow.（私は明日はバスで学校に行くつもりです。）

shallも未来を表しますが、かなりかしこまった言い方で、実際はあまり使いません。

I shall be 16 years old next month.（私は来月16歳になります。）

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：助動詞は1つの文に1つ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

助動詞は1つの文に1つしか入れられません（ , で区切られている場合は別の文と考えましょう）。2つ使いたいようなときは助動詞と同じ意味で使える熟語がありますので、それをつかいます。

can=be able to　（～できる）
must=have to　（～しなければならない）
will=be going to　（～する予定だ）

これらのtoの後には動詞の原形がはいります。

助動詞と組み合わせて使っても、単独でも使えます。

I am able to swim.（私は泳げる。）

You will have to take an examination next month.
（あなたは来月試験を受けねばならない。）""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '逆にする',
    "cosi": '疑問文',
    "accentContent": '★逆にする',
    "content": Text.rich(
      TextSpan(
        text: """
疑問文とは質問する形式の文のことです。疑問文の最後はピリオド（.）ではなくクエスチョンマーク（？）を使います。

You have a pen.（あなたはペンをもっている。）

この文を疑問形にしたいときは・・・

Do you have a pen?（あなたはペンをもっていますか？）

このように、動詞がbe動詞以外の動詞を使っている場合は、文の頭に助動詞doをつけて最後をクエスチョンマークにすれば疑問形のできあがりです。

This is your pen.（これはあなたのペンです。）

このように動詞がbe動詞のときは、

Is this your pen?（これはあなたのペンですか？）

主語とbe動詞の位置を逆にして、最後をクエスチョンマークにすればＯＫです。

You can swim.（あなたは泳げる。）

文に助動詞がはいっている場合は、

Can you swim?（あなたは泳げますか？）

主語と助動詞の位置を逆にして、最後をクエスチョンマークにします。

You will have to take an examination next month.
（あなたは来月試験を受けねばならない。）

このような助動詞と、助動詞と同じ意味を持つ熟語の場合も、

Will you have to take an examination next month?
（あなたは来月試験を受けねばなりませんか？）

主語と助動詞の位置を逆にして、最後をクエスチョンマークにすればＯＫです。""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '疑問詞は代用品',
    "cosi": '',
    "accentContent": '★疑問詞は代用品',
    "content": Text.rich(
      TextSpan(
        text: """
「疑問詞」を使った疑問文というのもあります。疑問詞には「いつ・どこで・だれが・何を・どのように」などを表す、

what（何を・何が）, where（どこで・どこに）, when（いつ） , why（なぜ）, who（誰が）, how（どのように）,which（どちらの）

があります。これらは疑問詞と呼ばれていますが、実は他の品詞（名詞・形容詞・副詞）などの代用品としての働きをしています。それぞれ何の代用品か見ていきましょう。

whatは疑問詞として文頭に位置し、名詞の働きをすることができます。名詞の働きですから主語、目的語・補語などになれます。

What happened ?（何が起こりましたか？）（文の主語）

What do you want ? （あなたは何が欲しいですか？）（wantの目的語）

What is this?（これは何ですか？）（補語 What＝this）

また、疑問詞として形容詞の働きをすることもできます。

What color do you like?（何色が好きですか？）

この文ではwhatが形容詞の働きをして名詞colorの説明をしていて、「What color」が動詞likeの目的語になっています。

Whereは疑問詞として文頭に位置し、副詞の働きをします。

Where do you live?（あなたはどこに住んでいますか？）

Whereが副詞の役割をしていますから、

Where do you live in?（×）

とやったら間違いです。自動詞に前置詞をつけるのは目的語をとるときだということを思い出してください。目的語は必ず名詞（名詞節・名詞句・代名詞も含む）でなければなりませんから、副詞であるwhereは目的語にはなれないのです。

Whenは疑問詞として文頭に位置し、副詞の働きをします。

When will you arrive at the airport?（いつ空港に着く予定ですか？）

自動詞arriveに前置詞atがついていますが、その後に目的語のthe airportが続いていますから問題なく文として成立しています。

Whyは疑問詞として文頭に位置し、副詞の働きをします。

Why do you study English?（なぜあなたは英語を勉強するのですか？）

Who は疑問詞として文頭に位置し、名詞の働きをします。

Who is he?（彼は誰ですか？）（補語 Who＝he）

Who will come to your house tomorrow?（誰が明日あなたの家にきますか？）（主語）

Who will you meet tomorrow?（明日あなたは誰と会いますか？）（目的語）

Whoをこのように目的語として使うのは口語、つまりくだけた言い方です。文書では、

Whom will you meet tomorrow?（明日あなたは誰と会いますか？）（目的語）

というふうにwhom（whoの目的格）を使います。

また「誰の～」というふうに「所有」を表したいときは、

Whose pen is this?（これは誰のペンですか？）

というようにwhose（whoの所有格）を使います。

Howは疑問詞として文頭に位置し、副詞の働きをします。

How do you study Spanish.（あなたはどのようにスペイン語を勉強しますか？）

副詞ですから形容詞を説明する働きもできます。

How old is he?（彼は何歳ですか？）

How many pencils do you have?（あなたは何本エンピツを持っていますか？）

How much money do you need?（あなたはどれくらいお金が必要ですか？）

Whichは疑問詞として文頭に位置し、代名詞や形容詞の働きをします。

Which is your house?（どっちがあなたの家？）

Which car do you want?（あなたはどちらの車がほしいですか？）

ここまでの疑問詞の例文でみてきたように、名詞の働きができるのはwhatとwho。代名詞と形容詞の働きができるのがwhich。副詞の働きができるのはwhere、when、why、how。

ですので例えば、

Where did you 10 years ago?

Ａ）live
Ｂ）live in
Ｃ）lived
Ｄ）lived in

という問題があったら、「動詞がないから空欄は動詞。助動詞の後だから動詞の原形。Whereと10 years agoは副詞だから、この文には目的語がない。なら前置詞は必要ない。」と考えてＡのliveを選ぶことができます。

また、

What do you _______ ?

Ａ）arrive
Ｂ）disappear
Ｃ）want
Ｄ）happen

という問題なら、「動詞がないから空欄は動詞。Whatは名詞の働きだから、目的語をとれる動詞を選べばいい。ということはＣのwantだ。」と考えることができます。""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '命令文では主語を省略',
    "cosi": '命令文',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
目に前にいる相手に命令するわけですから主語はyouなのですが、命令文では省略して動詞を文頭にします。

Open the door.（ドアを開け。）

この文では動詞openが文頭にきていますから命令文だということがわかります。

丁寧な言い方にする場合は、Pleaseをつけます。

Please open the door.（ドアを開けてください。）""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '進行形は形容詞',
    "cosi": '進行形',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
進行形とは、「～している最中である」ということを表し、

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: 'be動詞＋動詞～ing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

の形で使われます。be動詞が現在形なら「現在進行形」（～している）、be動詞が過去形なら「過去進行形」（～していた）といいます。「未来進行形」（～するだろう）は「will＋be＋動詞～ing」です。

He is feeding the goat.（彼はそのヤギにエサをあげている。）

The people were eating a meal in the restaurant.
（その人々はレストランで食事していた。）

You will be playing tennis this time tomorrow.
（明日の今頃あなたはテニスをしているだろう。）

""",
              ),
              TextSpan(
                text: '★：進行形は形容詞',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

ここで、次の2つの文を見比べてみましょう。

He is happy.

He is playing tennis.

He is までは同じで、その次が上の文はhappy、下の文はplayingという風に異なっていますね。ただ、主語 He と is でイコールの関係で結ばれていると考えれば、同じようなもの。

happyはもちろん形容詞ですが、実は、playingの方も形容詞のようなものなのです。playは動詞ですが、「1つの文に動詞は1つ」というルールからすればisという動詞があるので、playingは動詞ではありませんよね。

ならば、動詞ではなく形容詞と考えたほうがスッキリします。ただ、もともとが動詞なので、形容詞に動詞のニュアンスが含まれたものと考えればよいのです。（～ingは実際には形容詞でなく現在分詞と呼びますが）

動詞によっては進行形として使えないものもあります。例えばhave（持つ）は進行形にはできません。進行形にできない動詞は「状態」を表すものが多いです。学習の中で身につけましょう。

では、問題形式で例文を見てみましょう。

He is _______ the goat.

Ａ）feed
Ｂ）feeding
Ｃ）happen
Ｄ）happening

とういう問題なら、「選択肢は動詞か現在分詞。isという動詞があるから空欄には現在分詞がはいる。空欄の後は名詞だから目的語をとれるfeedの～ing形のＢのfeedingだ。」と考えることができます。""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '目的語を取れないなら受動態にできない',
    "cosi": '受動態',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
受動態とは「～される」という受け身の形をとっている文のことをいい、

be動詞＋過去分詞

で表されます。

The novel was written by her.（その小説は彼女によって書かれた。）

主語The novel（小説）がwritten（書かれた）ということですね。
受動態のときはby～というふうに「～によって」という表現が多く使われます。
「by～」は省略されることもよくあります。

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：目的語を取れないなら受動態にできない',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """


受動態では目的語をとることができる形で動詞を使わなければなりません。すなわち、「他動詞」または「自動詞＋前置詞」の形です。

writeは目的語をとることができる動詞ですから、受動態にしても何も問題がないわけですね。

The novel was written by her.

を能動態の文で表すと、

She wrote the novel（彼女はその小説を書いた。）

となります。

この2つの文は「小説が彼女に書かれた」と「彼女が小説を書いた」という表裏一体の関係といっていいでしょう。能動態の目的語が受動態のときは主語になるという形です。

今のは目的語を1つしかとらない動詞の例でしたが、今度は目的語を2つ取れる動詞の例を見てみましょう。

The pen was given to me by her.（そのペンは彼女によって私に与えられた。）

これを能動態に直すと、

She gave me the pen.（彼女はそのペンを私にくれた。）

または、

She gave the pen to me.（彼女はそのペンを私にくれた。）

です。

能動態では目的語だったthe penが受動態では主語になっています。能動態でgiveを使った場合はmeとthe penの2つが目的語ですから、

I was given the pen by her. （そのペンは彼女によって私に与えられた。）

このように主語をIにして受動態にすることもできます。

能動態の目的語が受動態のときは主語になるのですから、例えば、

I was stolen my credit card by someone.（×）

はダメですが、

My credit card was stolen by someone.
（私のクレジットカードは何者かによって盗まれた。）

はＯＫです。なぜかというと、steal（盗む）という動詞は目的語をひとつしかとれない動詞だからです。能動態でみると、

Someone stole my credit card.（何者かが私のクレジットカードを盗んだ。）

になります。つまり、stealは目的語をひとつしかとれない動詞ですから能動態にしようとしたとき、

Someone stole me my credit card.（×）

こんなふうに目的語を2つとることはできないわけですね。

ちょっとややこしいのですが、「能動態の目的語が受動態のときは主語になる」、「受動態の主語が能動態の目的語になる」という表裏一体の関係が分れば理解できると思います。""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '補語は受動態の主語にはできない',
    "cosi": '',
    "accentContent": '：補語は受動態の主語にはできない',
    "content": Text.rich(
      TextSpan(
        text: """
今度はこの文をみてください。

I found the book interesting.（その本は面白いとわかった。）

能動態ですね。目的語がthe bookですから、この文を受動態にするときは

The book was found interesting（by me）.

になります。interestingを主語にした受動態はできません。なぜかというと、「形容詞だから」ではありません。interestingは目的語the bookとイコールで結ばれた補語です。能動態のとき補語である語は名詞だろうと形容詞だろうと受動態の主語にはなれないのです。

「～によって」という意味で「by～」を使うと説明したのですが、状況によってはby以外の前置詞を使います。例を以下に挙げますが、たくさんあるので学習の中で身につけましょう。

Cheese is made from milk.（チーズは牛乳から作られる。）（原材料を表すときはfrom）

This desk is made of wood.（この机は木でできている。）（姿を変えない材料のときはof）

The mountain is covered with snow.（その山は雪でおおわれている。）（熟語）

I’m interested in English.（私は英語に興味がある。）（熟語）

例えば、

My credit card _______ by someone.

Ａ）steals
Ｂ）stealing
Ｃ）was stealing
Ｄ）was stolen

という問題があったら、「動詞がないから空欄は動詞。主語が物だから、～するという意味にはなりにくいし、～されるという意味だとピッタリくるからＤのwas stolenだ。文法的にも問題ないからよし。」と考えることができます。""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '時制は6種類',
    "cosi": '',
    "accentContent": '★時制は6種類',
    "content": Text.rich(
      TextSpan(
        text: """
時制と言うのは大きく分けて「現在」「過去」「未来」「現在完了」「過去完了」「未来完了」の6種類があります。

動詞も時制によって変化するのですが、どの時制でどういう風に変化するかをみていきましょう。

【現在形】動詞の現在形。
He goes to the school library.（彼は学校の図書館へ行く。）

【過去形】動詞の過去形。
He went to the school library.（彼は学校の図書館へ行った。）

【未来形1】be動詞 going to ＋動詞の原形。
He is going to go to the school library.（彼は学校の図書館に行く予定だ。）

【未来形2】will＋動詞の原形。
He will go to the school library.（彼は学校の図書館に行く予定だ。）

【現在完了形】have＋過去分詞。
He has gone to the school library. （彼は学校の図書館に行ってしまった。）

【過去完了形】had＋過去分詞。
He had gone to the school library. （彼は学校の図書館に行ってしまっていた。）

【未来完了形】will＋have＋過去分詞
He will have gone to the school library.
（彼は学校の図書館に行ってしまっているだろう。）""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": 'ある時点を境に考える',
    "cosi": '',
    "accentContent": '★ある時点を境に考える',
    "content": Text.rich(
      TextSpan(
        text: """
例えば、今現在が2007年4月5日の午後1時だとしてそれぞれの違いをみていきましょう。

「現在形」・・・今現在の1点を表す。すなわち、2007年4月5日の午後1時ちょうど。

「過去形」・・・過去のある1点を表す。2007年4月5日の午後1時よりも前。同じ日の午前10時も過去だし、2007年4月4日午後11時も過去。とにかく「現在」よりも過去であれば、その1点を表すときは1秒前でも10億年前でも過去形を使います。

「未来形」・・・未来のある1点を表す。2007年4月5日の午後1時よりも後。同じ日の午後2時も未来だし、2007年4月6日午後8時も未来。とにかく「現在」よりも未来であれば、その1点を表すときは1秒後でも10億年後でも未来形を使います。

「現在完了形」・・・「過去」から「現在」までの間の期間のニュアンスを含み現在を表す。「完了」「継続」「経験」の用法があります。

・現在完了の「完了」・・・過去の何からの動作の結果、今現在どうであるかを表します。

He has gone to the school library already. （彼はもう学校の図書館に行ってしまった。）

この文でみると、「過去」のどの段階かに彼は学校の図書館にでかけたわけですね。そのニュアンスを含みつつ、「現在」の状態は「でかけていなくなった状態」ということを表しているのです。

alreadyは「もう」という意味の副詞で、完了形でよく使われる語です。このalreadyは肯定文のときに使うのですが、疑問文や否定文のときは同じ「もう」という意味で「yet」という副詞を使います。

Have you finished your homework yet ?（宿題はもう終わったの？）

・現在完了の「継続」・・・「過去」からスタートして「現在」までつづいている動作・状態を表します。

I have lived here for 7 years.（私はここに7年間住んでいます。）

この文では、「過去」である7年前に住みはじめて「現在」も継続して住んでいることを表しています。「継続」ですから7年間は全て含んでいるわけです。1年前も、3年前も、6年前も住んでいたというニュアンスです。

ここで使われているforは「期間」を表す前置詞で、現在完了の継続用法でよく使われる語です。「～以来」という意味でsinceという語も現在完了の継続用法でよく使われます。

I have lived here since 1995.（私はここに1995年から住んでいます。）

・現在完了の「経験」・・・今現在の主語は、過去に何らかの経験をしたということを表す。

I have been to London before.（私は以前にロンドンに行ったことがある。）

この文では今現在の「私」が、過去にロンドンに行ったことがあるかないかを表しています。

Have you ever played lacrosse ?（今までにラクロスをやったことがありますか？）

この文では今現在の「あなた」が、過去にラクロスをやったことがあるかないかを質問しています。

I have never played lacrosse.（私はラクロスを1度もやったことがありません。）

現在完了の経験用法では、ever（今までに）、never（決して～ない）、before（以前に）などの副詞がよく使われます。Everは疑問文か否定文で使います。

「過去完了形」・・・「過去よりも過去」から「過去」までの間の期間のニュアンスを含み過去を表す。「完了」「継続」「経験」の用法があります。

・過去完了の「完了」・・・「過去よりも過去」の何からの動作の結果、「過去」の時点でどうであるかを表します。

He had gone to the school library already.
（彼はもう学校の図書館に行ってしまっていた。）

この文でみると、「過去よりも過去」のどの段階かに彼は学校の図書館にでかけたわけですね。そのニュアンスを含みつつ、「過去」の状態は「でかけていなくなっていた状態」ということを表しているのです。

過去完了でも副詞alreadyやyetは「もう」という意味で、よく使われます。

・過去完了の「継続」・・・「過去」からスタートして「現在」までつづいている動作・状態を表します。

I had lived here for 7 years.（私はここに7年間住んでいました。）

この文では、「もっと過去」から「過去」まで7年間継続して住んでいることを表しています。「継続」ですから7年間は全て含んでいるわけです。

「期間」を表すforは過去完了の継続用法でもよく使われる語です。「～以来」という意味のsinceも過去完了の継続用法でよく使われます。

I had lived here since 1995.（私はここに1995年から住んでいた。）

・過去完了の「経験」・・・過去の主語は、もっと過去に何らかの経験をしたということを表す。

Had you ever played lacrosse ?（それまでにラクロスをやったことがありましたか？）

この文では過去の「あなた」が、もっと過去にラクロスをやったことがあったかなかったを質問しています。

I had never played lacrosse.（私はラクロスを1度もやったことがありませんでした。）

過去完了の経験用法でも、ever（それまでに）、never（決して～ない）、before（以前に）などの副詞がよく使われます。Everは疑問文か否定文で使います。              
                    """,
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '語句で時制を見極める',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
時制が空欄で問われることはよくあります。
そのときは文のどこかに時制を表す語句がないかチェックして、それに対応する語句を選択肢から選びましょう。

例えば、

He _______ here since 1995.

Ａ）lives
Ｂ）lived
Ｃ）will live
Ｄ）has lived

という問題があったら、「文末にsinceがある。ということは動詞は完了形だな。」ということでＤを選ぶことができます。

He _______ here 5 years ago.

Ａ）lives
Ｂ）lived
Ｃ）will live
Ｄ）has lived

という問題だったら「文末がagoだ。ということは動詞は過去形だな」ということでＢを選ぶことができます。

TOEIC対策としては、

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: """
since , for は完了形の文中で使われる。
last , agoは過去形の文中で使われる。
usuallyは現在形の文中で使われる。

""",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
のように覚えておくといいでしょう。

already、yet、ever、never、beforeなどは完了形以外の時制でも使われますのでご注意ください。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '動名詞が主語なら、動詞は単数形',
    "cosi": '動名詞',
    "accentContent": '★動名詞が主語なら、動詞は単数形',
    "content": Text.rich(
      TextSpan(
        text: """
動名詞とは「動詞の原形 + ～ing」の形で「～すること」の意味をあらわし、名詞の働きをします。また、動詞のように目的語をとってセットで名詞の働きをすることもできます（元になる動詞が目的語をとることができる場合）。動作の意味的なニュアンスを持った名詞と考えればいいと思います。文の中に動名詞だけがあっても動詞がなければ「文」としては成立しませんのでご注意ください。動名詞は単数形です。なので、動名詞が主語にきたら、動詞も単数です。

名詞の働きをするということは、当然、主語にもなることができます。

Playing tennis is good for the health.（テニスをすることは健康に良い。）

主語はPlaying tennis。Playingが動名詞です。playは目的語をとることのできる動詞ですね。単数扱いしますから動詞がisになっています。

Playing tennis good for the health.

Ａ）is
Ｂ）are
Ｃ）were
Ｄ）this

という問題があったとしたら「この文には動詞がないから空欄には動詞が入る。主語がPlaying tennisだから単数。ということはＢのisだな。」と考えることができます。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '動名詞を目的語にする動詞を覚える',
    "cosi": '',
    "accentContent": '★動名詞を目的語にする動詞を覚える',
    "content": Text.rich(
      TextSpan(
        text: """
さらに、名詞の働きをするということは、目的語になることもできるわけですが、動名詞を目的語にとることのできる動詞はある程度決まっていまして、主なものは以下です。（これらの語はもちろん、動名詞だけでなく普通の名詞も目的語にとることができますが、後で説明する「不定詞」は目的語にとることができません。）

admit（～を認める）, avoid（～を避ける）, consider （～を考える）,
enjoy（～を楽しむ）, escape（～から逃れる）,delay（～を延期する）,
finish（～を終える）,practice（～を練習する）, quit（～をやめる）,
regret（～を後悔する）,suggest（～を提案する）

She admitted having made a mistake.（彼女は間違ったことを認めた。）

この文は主語がShe、動詞がadmitの過去形admitted、目的語がhaving made a mistakeです。having made a mistakeは別項でやった完了形になっています。完了形を動名詞にするときはhaving＋過去分詞になります。この文には「間違った」のは「間違いを認めた」よりも過去のことだというニュアンスが含まれています。

He avoided meeting her.（彼は彼女と会うのを避けた。）

He is considering building a house.（彼は家を建てることを考えている。）

I enjoyed talking with her.（私は彼女と話すのを楽しんだ。）

She escaped being punished.（彼女は罰せられることから逃れた。）

I delayed buying a car.（私は車を買うのを延期した。）

He finished reading the novel.（彼はその小説を読み終えた。）

I practiced playing the guitar.（私はギターをひく練習をした。）

She quit thinking about the problem.（彼女はその問題について考えるのをやめた。）

He regretted drinking.（彼は酒を飲んだことを後悔した。）

He suggested going to the concert.（彼はそのコンサートに行くことを提案した。）

例えば、

He is considering _______ a house.

Ａ）builds
Ｂ）built
Ｃ）building
Ｄ）to build

という問題があったとしたら、「この文の動詞はis considering。considerは動名詞をとる語だから、Ｃのbuildingだ。」と考えることができます。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '不定詞を目的語にする動詞を覚える',
    "cosi": '不定詞',
    "accentContent": '★不定詞を目的語にする動詞を覚える',
    "content": Text.rich(
      TextSpan(
        text: """
不定詞は「to＋動詞の原形」で、使い方によって名詞の役割もできれば、形容詞の役割もできれば、さらには副詞の役割もできます。

まずは、名詞の役割の例です。

To play tennis is good for the health.（テニスをすることは健康に良い。）

「To play tennis」が名詞の役割をして主語になっていますね。

I want to play tennis.（私はテニスをしたい。）

この文では「to play tennis」が他動詞wantの目的語になっています。

不定詞を目的語にとれる語はある程度決まっています。主なものは以下です。
（これらの語はもちろん不定詞だけでなく普通の名詞も目的語にとることができますが、動名詞は目的語にとることができません。）

agree（～に同意する）, decide（～を決定する）,
expect（～だと予期する・～する予定である）,
hope（～したいと思う）,intend（～するつもりである）,
manage（なんとか～をやりこなす）, plan（～する予定である）,
promise（～しそうである）,refuse（～することを拒絶する）,want（～したいと思う）, wish（～したいと思う）

He agreed to sign the contract.（彼はその契約書に署名することに同意した。）

She decided to quit her job.（彼女は退職すると決めた。）

He expected to be killed.（彼は殺されることを予期していた。）

I expect to arrive at the airport at seven.（私は7時に空港に着く予定です。）

I hope to come here.（またここに来たいと思います。）

He intends to win the race.（彼はそのレースに勝つつもりだ。）

I managed to finish my homework.（私は何とか宿題をやり終えた。）

I plan to sell my car.（私は車を売るつもりだ。）

He promises to be a good teacher.（彼はよい先生になりそうだ。）

She refused to answer my question.（彼女は私の質問に答えようとしなかった。）

I wish to be live abroad.（海外に住めたらなあ。）

ちなみにwant , hope , wishは「～したいと思う」でもニュアンスの違いがあります。

Want・・・確実に実現できそうなことを望む
Hope・・・ある程度実現できそうなことを望む
Wish・・・あまり実現できなそうなことを望む

今みた通り、動名詞、不定詞ともに名詞的な役割をして目的語になることができるのですが、そのときのニュアンスには少し違いがあります。どんな違いかというと動名詞はたいてい「過去」、不定詞はたいてい「未来」のニュアンスを含んでいるのです。絶対ではないのですが、先ほどの動名詞と不定詞の例文を見比べてみてみると、だいたいそうなっていることが分ると思います。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '不定詞には意味上の主語がある',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
今度は不定詞が形容詞の役割をするときをみてみましょう。

I’d like something to drink.（私は何か飲み物がほしい。）

この文では、不定詞「to drink」が名詞「something」の説明する形容詞の役割をしています。このように形容詞の役割で不定詞が使われるとき、不定詞の動詞の原形は必ず目的語をとれるものでなければなりません。すなわち、「to＋他動詞」または「to＋自動詞＋前置詞」の形でなければならないということです。この例でみてもdrinkは目的語をとることができる動詞です。ですから、

I don’t have any house to live.（×）

ではダメです。

I don’t have any house to live in.（私は住む家がない。）

自動詞liveに前置詞inがついた形。このように目的語をとることができる形になっていなければいけません。

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：不定詞には意味上の主語がある\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

また、不定詞を形容詞としての役割でつかうとき、「for」を使って不定詞に意味上の主語をつけることもできます。

I’d like something for him to drink.（私は何か彼が飲む物がほしい。）

この文はfor himが不定詞の前にきていますね。こういう場合はhimがdrinkの意味上の主語になります。つまり、「him」（彼）が「drink」（飲む）という関係になっています。

I’d like something to drink.

は、実は

I’d like something for me to drink.

ということなのですが文の主語と「drink」の意味上の主語が同じため、for meが省略されているのです。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '不定詞が副詞の役割をするときは、目的語をとる形になる',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
ちなみに先ほど、名詞の役割をする不定詞をとる動詞としてwantを紹介しましたが、wantは、

I want you to mow a loan.（私はあなたに芝を刈ってほしい。）

のように「for」を使わなくても不定詞の意味上の主語をつけることができます。
「for」を使わなくても不定詞の意味上の主語をつけることができる動詞、すなわち「動詞＋人（または物）＋to＋動詞の原形」をとることのできる動詞はたくさんありますので学習する中で身につけましょう。以下に主なものをあげておきます。

allow （～することを許可する）, advise（～するよう忠告する）,ask（～するよう頼む） enable（～できるようにする） , encourage（～するよう励ます）, force（強いて～させる）, persuade（～するよう説得する） , want （～して欲しい）

My father won’t allow me to stay out late.
（私の父は私が遅くまで外出することを許してくれない）

I advised her to stop smoking.
（私は彼女に禁煙するよう忠告した）

He asked her to accompany her on the piano.
（彼は彼女にピアノの伴奏をしてくれるよう頼んだ）

The coffee enabled me to keep awake durling the concert.
（コーヒーのおかげでその退屈なコンサートの間ん眠らずにいられた）

The teacher encouraged him to study abroad.
（先生が彼を留学するよう励ました）

They forced him to sign the paper.
（彼らは彼に無理やり書類にサインさせた）

His father persuaded him to go to college.
（彼の父は彼に大学に行くよう説得した）

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★不定詞が副詞の役割をするときは、目的語をとる形になる\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
今度は不定詞が副詞の役割をする用法をみてみましょう。

This problem is hard to solve.（この問題は解決するのが難しい。）

この文は不定詞「to solve」が副詞の役割をして、形容詞hardを説明しています。
solveは他動詞です。不定詞が副詞の役割をするときは、形容詞の役割をするときと同じく、目的語をとることができる形でなくてはなりません。すなわち、「to＋他動詞」または「to＋自動詞＋前置詞」の形でなければならないということです。

不定詞は形容詞の役割・副詞の役割をするときは、目的語をとることができる形でなくてはならない。と、まとめて覚えておきましょう。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": 'カタマリとして捉える',
    "cosi": '分詞',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
｢分詞｣には動詞に～ingをつけた「現在分詞」、主に～edをつけた「過去分詞」の2種類あり、形容詞の役割をすることができます。

The girl playing the piano is Jane.（ピアノをひいている女の子はジェーンです。）

名詞girlをplaying the pianoを説明しています。分詞は動詞のニュアンスも含んでいるのでplayingがthe pianoという目的語をとった形になっていてgirlを説明しています。

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '：カタマリとして捉える\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
形容詞的な語が文の中にたくさんあると頭がごちゃごちゃしてしまうこともあると思います。そんなとき文の構造をカンタンに把握するためには「The girl playing the piano」をひとかたまりの主語として考えるといいでしょう。カッコでくくって考えると分りやすいです。

（The girl playing the piano）is（Jane）.

こうすれば、

The girl is Jane.

という超カンタンな文にちょっと肉付けされただけと分ります。「主語」や「目的語」や「補語」それぞれにいろんな形容詞などがついてごちゃごちゃしている文でも、それぞれをかたまりとして捉えれば怖くありません。できるだけこの感覚を身に付けるようにしましょう。

The book written in English is hard to read.（英語で書かれた本は読むのが大変だ。）

この文は過去分詞が名詞を説明していますね。

例えば、

The girl _______ the piano is Jane.

Ａ）plays
Ｂ）played
Ｃ）have played
Ｄ）playing

という問題があったとしたら、「動詞isがあるから、空欄には動詞は必要ない。選択肢で動詞以外なのはＤのplayingだ。」と考えることができます。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '条件を表すif節の中では未来のことでも動詞は現在形',
    "cosi": '接続詞',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
文と文、語と語、句と句、節と節をつなぐときは接続詞を使います。文と文をつなぐときは必ず接続詞が必要です。接続詞には、

although（～だけれども）、and（～と）、as（～のとおりに）、because（～なので）、but（しかし）、if（もしも～なら）or（・・・か～・さもないと）,othewise（さもないと）,
since（～なので）,so（なので）,though（～だけれども）,unless（～でなければ）,
when（～するとき）,whenever（～するときはいつでも）

などがあります。

Although he made a mistake , anyone didn’t blame him for it.
（彼は間違いをしたけれども、だれもそのことで彼を責めなかった。）

Althoughは必ず文頭で使います。

He studies English and Chinese.（彼は英語と中国語を勉強しています。）

I sat on the chair as he said.（私は彼が言ったとおりにそのイスに座った。）

I drank water because I was thirsty.（私はノドが渇いていたので水を飲んだ。）

He is rich but stingy.（彼は金持ちだがケチだ。）

Was it blue or red?（それは青でしたか、赤でしたか？）

Study hard , otherwise I won’t allow you to watch TV.
（いっしょうけんめい勉強しなさい。そうでないとテレビをみせませんよ。）

Since you are young , you have to work hard.
（あなたは若いのだから一生懸命働かなければならない）

It was late ,so I went to bed.（遅かったので寝た。）

Though it was cold, I went out.（寒かったけれども私は外出した。）

You will miss the bus unless you get up now.
（今起きないとあなたはそのバスに乗り遅れる。）

When I was young, I was poor.（私は若い頃貧乏だった。）

Whenever I go cycling , it rains.（私がサイクリングに行くときはいつでも雨が降る。）

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：条件を表すif節の中では未来のことでも動詞は現在形\n\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """
If it rains tomorrow , I won’t go swimming.（明日雨が降るなら、私は泳ぎに行きません。）

条件を表すif節の中では未来のことでも動詞は現在形になります。ですので、

If it _______ tomorrow , I won’t go swimming.

Ａ）rains
Ｂ）rained
Ｃ）raining
Ｄ）will rain

という問題があったら、「tomorrowがあるけどif節だから現在形のＡのrainsだな。」と考えることができます。Ifを使って現実に反する仮定を表す「仮定法」というのがありますが、それについては後の項でご説明します。

_______ he made a mistake , anyone didn’t blame him for it.

Ａ）And
Ｂ）So
Ｃ）Since
Ｄ）Although

という問題なら「カンマがあってそれぞれ主語・動詞があるから、空欄には文と文をつなぐ接続詞がはいる。間違えたのと誰も責めなかったのは逆説だからＤのAlthoughだ。」と考えることができます。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '文と文がピリオドで区切られていたら接続副詞',
    "cosi": '接続副詞',
    "accentContent": '★文と文がピリオドで区切られてたら接続副詞',
    "content": Text.rich(
      TextSpan(
        text: """
接続副詞は文と文を「意味的にだけ」つなぎます。接続詞との違いは必ず文と文がピリオド（.）で区切られていることです。文と文はピリオドで分けられているのですが、意味的につなぐのです。接続副詞には主に、

however（しかしながら）

という語があります。副詞なので文中に入る位置はいろいろです。

例をみてみましょう。

He was tired. However ,He stayed up late.（彼は疲れていた。しかしながら夜更かしした。）

He was tired.は最後にピリオドがついていて文として完結していますね。

He was tired. He stayed up late ,however .（彼は疲れていた。しかしながら夜更かしした。）
副詞の役割も含んでいるので、このように文の最後にしても大丈夫です。上2つの例でみたように、接続副詞を使うときはたいてい前か後ろにカンマ（,）をつけることが多いです。

接続詞butをつかった場合は、

He was tired , but He stayed up late. （彼は疲れていたが夜更かしした。）

このようにカンマで文と文をつなぐことができます。

接続副詞と同じように使える語として

besides（そのうえ）, therefore（それゆえ）。

などがあります。これらは副詞です。

He is rich. Besides he is handsome.（彼は金持ちだ。その上、彼はハンサムだ。）

It rained. Therefore , the baseball game was canceled.
（雨が降った。それゆえ、野球の試合は中止された。）

nevertheless（それにもかかわらず）という副詞も似たような使い方ができるのですが、文と文の間に使うときはセミコロン（;）を使います。

He hurried ; nevertheless he missed the train.
（彼は急いだ。にもかかわらずその電車に乗れなかった。）

とまあ、接続副詞はこんなふうに使うわけです。ですので例えば、

He was tired. _______ He stayed up late.

Ａ）However
Ｂ）But
Ｃ）Although
Ｄ）So

という問題があったら、「文と文がピリオドで区切られている。こんなときは接続副詞だ。」ということでHoweverを選ぶことができます。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '長い説明は後ろ',
    "cosi": '関係代名詞',
    "accentContent": '★長い説明は後ろ',
    "content": Text.rich(
      TextSpan(
        text: """
関係代名詞は、そのときどきで意味上の主語になったり目的語になったり補語になったりしつつ、他の語の説明をするという働きをもっています。すなわち名詞と形容詞の2つの働きをもっていて、ときには2つの機能を同時にこなします。

関係代名詞には、

which、who、that、what、thatがあります。

説明する名詞が「物」の場合、

This is the novel which she wrote.（これは彼女が書いた小説です。）

このように関係代名詞whichを使うことができます。この文では名詞the novelを関係代名詞以下が説明しています。the novelはshe wroteの目的語です。

This is the novel.

のthe novelに「どんな小説か」という説明をするため

She wrote the novel.

の2つの文を足した形になっているのです。

別の言い方をすると、

This is the new novel.（これは新しい小説です。）

の形容詞newと、

This is the novel （which she wrote）.（これは彼女が書いた小説です。）

のカッコ内は文法的にはほぼ同じようにthe novelを説明しています。

形容詞newは名詞novelの前に入っていますが、（which she wrote）は長いので名詞の後ろに入っています。名詞を長々と説明したい場合はその名詞の後ろにwhichをつけて主語・動詞を続ければいいというのが1つのパターンです。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '意味上の主語になっているとき、関係代名詞は省略できない',
    "cosi": '',
    "accentContent": '★意味上の主語になっているとき、関係代名詞は省略できない',
    "content": Text.rich(
      TextSpan(
        text: """
前項のように関係代名詞に主語・動詞が続いて目的語となる名詞を説明する際は、動詞は目的語をとれる形でなければなりません（この場合はwriteの過去形wroteが他動詞）。ちなみに、関係代名詞に主語・他動詞が続いて目的語となる名詞を説明する際は、

This is the novel she wrote.

のようにwhichを省略することができます。

また、「which＋主語＋動詞」の動詞が自動詞の場合は、

This is the house in which I lived.（これは私が住んでいた家です。）

このようにwhichの直前に前置詞をもってきます。この場合はwhichは省略できません。

The novel which is in the top drawer is hers.
（一番上の引き出しに入っている小説は彼女のものです。）

この文は名詞the novelを関係代名詞以下が説明しているという点では先ほどと同じなのですが、先ほどと違って関係代名詞のスグ後に動詞がきています。whichが直後の動詞isの意味上の主語になっているのです。こういうふうにも使うことができます。関係代名詞whichからdrawerまでがThe novelを形容詞のように説明していますからこの文の見方としては、

（The novel which is in the top drawer）is hers.

カッコ内の（The novel which is in the top drawer）が主語、2つ目のis（her直前のis）が動詞、hersが補語です。ちなみに意味上の主語になっているとき、関係代名詞は省略できません。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '関係代名詞thatはカンマでつなげない',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
名詞が「人」の場合は関係代名詞whoを使って、

The man who stands there is David.（そこに立っている男はデイビッドです。）

とすることができます。この文ではwhoがstandsの意味上の主語になっていますね。

The manを目的語にして説明するようなときは、

The man whom I met yesterday is David.（私が昨日会った男はデイビッドです。）

whoの最後にmをつけてwhomという形で使います。

また、

The man whose right arm is broken is David.（右腕を骨折している男はデイビッドです。）

のようにwhoseの形で使った場合は「名詞の～が」（この場合The manのright armが）という意味で使うことができます（省略不可）。また、

The house whose wall is painted green is mine.
（その壁が緑色に塗られた家は私のものです。）

このようにwhoseの形をとっている場合は名詞が「物」（この場合はThe house）でも使うことができます。

which、who、whose、whomの直前にカンマをいれたり,はさんだりしてもＯＫです。ただし、thatはこの用法はできません。

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：関係代名詞thatはカンマでつなげない',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """


This is the novel , which she wrote.（これは小説で、彼女が書いたものです。）

The novel , which is in the top drawer , is hers.
（その小説、引き出しのなかにあるヤツ、は彼女のです。）

The man , who stands there , is David.
（その男、そこに立っている人、はデイビッドです。）

文が短いため訳がちょっとぎこちないですが意味は同じです。

thatは説明する名詞が「人」でも「物」でも使えます。

This is the novel that she wrote.（これは彼女が書いた小説です。）

The man that I met yesterday is David.（私が昨日会った男はデイビッドです。）

でも「人」のときはほとんどwhoを使うと覚えておきましょう。

また、

This is the house that I lived in.（これは私が住んでいた家です。）

この文、whichを使ったときは先ほどみた例文

This is the house in which I lived.

のようにwhichの前に前置詞inをもってきましたが、thatの場合はliveの後にinをおきます。ちなみにこのthatは省略可能です。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '関係代名詞whatは名詞',
    "cosi": '',
    "accentContent": '★関係代名詞whatは名詞',
    "content": Text.rich(
      TextSpan(
        text: """
関係代名詞whatはちょっと特殊で、「～すること」もしくは「～するもの」という意味で名詞の働きをし、文の主語、補語、目的語などになります。他の関係代名詞と違い、説明する名詞は必要なく、what自身が名詞の意味を持ちます。

What she said is true.（彼女が言ったことは本当だ。）（主語）

Tell me what you have experienced.（経験してきたことを私に話して。）（目的語）

This is what I bought yesterday.（これは昨日私が買ったものです。）（補語）

関係代名詞の説明は以上ですが、ちょっと復習してみましょう。

This is the house _______ I lived.

Ａ）which
Ｂ）in which
Ｃ）who
Ｄ）whose

という問題があったとしたら、「the houseという物を説明するわけだからwhoはないな。空欄の後もI livedというふうに、意味的に主語と動詞の関係になっているからwhoseもない。liveは目的語をとれない動詞だから前置詞が必要だ。」というように考えることができ、Ｂのwhichを選ぶことができます。

_______ she said is true.

Ａ）What
Ｂ）Who
Ｃ）Which
Ｄ）Why

という問題なら、「saidとis、動詞が2つある。saidの意味上の主語はsheっぽいから、文の動詞はisかな。とすると文の主語がないから、空欄も含めて名詞にしなきゃ。それができるのは・・・Whatだ。」というように考えることができます。

The house ________ wall is painted green is mine.

Ａ）which
Ｂ）that
Ｃ）who
Ｄ）whose

という問題なら、「関係代名詞の問題か。The houseは物だからwhoは消し。空欄の後にwall is painted greenというふうに受動態で意味上の主語、動詞、補語が続いていて目的語をとれない形。Ａのwhichに前置詞はついてないからダメだし、Ｂのthatもダメ。Ｄのwhoseならthe houseという名詞を説明できるし、空欄後のwallとひとかたまりで意味上の主語になれる。」と考えることができます。

ここまで、穴埋め例題のたびにこういった考え方をご紹介してきましたが、あくまでも感覚を文字におこすとこうなるという話であって、実際は今のThe house～ではじまる問題なんかは、見た瞬間にwhoseだなってピピっときて、10秒もかけずに解いていくような感じです。今はまだ文法力に自身がない状態でも、基礎を意識しつつ英文をたくさん読んだり問題を解いたりしているとどんどん力がついてくるのが実感できますのでがんばりましょう。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '関係副詞は省略できない',
    "cosi": '関係副詞',
    "accentContent": '★関係副詞は省略できない',
    "content": Text.rich(
      TextSpan(
        text: """
関係副詞とは、関係代名詞と同じように名詞の説明をするものですが、名詞の意味によって使い分けます。

関係副詞には、

where、when、why、how

があります。

■関係副詞where

関係副詞whereは「場所」を表す名詞を形容詞的に説明します。

This is the house where I lived.（これは私が住んでいた家です。）

この文は関係代名詞whichでみた

This is the house in which I lived.（これは私が住んでいた家です。）

と同じ意味です。上の2つの文はwhereとin whichが違う以外は全部同じですね。
つまり、where＝in whichなわけですね。場所を表す名詞もしくは関係副詞の後に続く動詞によってはwhere＝at whichの場合もあるでしょうが、いずれにせよ関係副詞whereは場所を表す名詞を形容詞的に説明するもので、前置詞が含まれているということです。

カンマで区切ることもできます。

This is the house , where I lived.（これは家です、ここに私は住んでいました。）

This is the house I lived（×）.

のようなwhereの省略はできません。whereに含まれる前置詞もなくなってしまうとlivedが目的語をとれませんので文として成立しないので。

■関係副詞when

関係副詞whenは「時」を表す名詞を形容詞的に説明します。

It was the day when he returned from the U.S.
（彼がアメリカから戻ってきたのはその日だった。）

「時」を表す名詞にはtimeとかいろいろありますが、みたら感覚でわかると思います。

カンマで区切ることもできます。

It was the day, when he returned from the U.S.
（その日でした。彼がアメリカから戻ってきたのは。）

省略もできます。

It was the day he returned from the U.S.
（その日でした。彼がアメリカから戻ってきたのは。）
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '関係副詞howは省略できない、カンマで区切れない',
    "cosi": '',
    "accentContent": '★関係副詞howは省略できない、カンマで区切れない',
    "content": Text.rich(
      TextSpan(
        text: """
■関係副詞why

関係副詞whyは「理由」を表す名詞を形容詞的に説明します。理由を表す名詞はたいていreasonです。

The reason why the airplane was delayed was bad weather.
（飛行機が遅れた理由は悪天候でした。）

whyはカンマで区切ってはいけませんが、省略はできます。

The reason the airplane was delayed was bad weather.

■関係副詞how

関係副詞howはちょっと特殊で、「～する方法」という意味をもち名詞の働きをします。

This is how he succeeded in the examination.（このようにして彼はその試験に合格した。）

Howは省略もできませんし、カンマで区切るのもダメです。

ちなみに関係代名詞と関係副詞のことをまとめて関係詞とよんだりします。

では、この項を軽く復習してみましょう。

This is the house _______ I lived.

Ａ）which
Ｂ）that
Ｃ）where
Ｄ）why

という問題があったとしたら、「関係詞の問題か。livedに前置詞がついてない。じゃあwhereだ。」と考えることができます。

This is _______ he succeeded in the examination.

Ａ）which
Ｂ）who
Ｃ）whose
Ｄ）how

というも問題なら、「he以下はこれ以上目的語がとれない形だな。isの目的語か補語が必要だから名詞の働きのあるhowだ。」と考えることができます。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '仮定法ではwasではなくwereを使う',
    "cosi": '仮定法',
    "accentContent": '★仮定法ではwasではなくwereを使う',
    "content": Text.rich(
      TextSpan(
        text: """
仮定法はifを使って「もしも～なら」「もしもあのとき～だったら、」「万一～になったら」というように現在、過去、未来を表すかたちがあり、事実に反する仮定や現実にはありそうにない仮定を表します。

■仮定法過去

「もし今～なら」：
If ＋主語＋動詞の過去形, 主語＋助動詞の過去形＋動詞の原形
または、
If＋助動詞の過去形＋動詞の原形, 主語＋助動詞の過去形＋動詞の原形

意味としては現在の仮定なのですが、動詞は過去形にを使うことに注意しましょう。

If I were a genius , I could solve this difficult problem easily.
（もし私が天才なら、この難しい問題を簡単に解けるだろうに。）

この文ではIf節の中でbe動詞の過去形wereが使われています。主語がIなのですが仮定法ではwasではなくwereを使います。

If I had 30 million yen , I would buy a house.
（もしも私が3,000万円もっているなら、家を買うのに。）

If I could quit smoking , I might not become ill.
（もしも私がタバコをやめることができるなら、病気にならないかもしれないのに。）

If it were not for the sun , we could not live.
（もしも太陽がなければ、私たちは生存できない。）

「If it were not for～」は決まり文句で「もし～がないなら」という意味です。

動詞wishは仮定法の節を導きます。

I wish I were a bird.（私が鳥ならいいのに。）
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '仮定法過去完了は過去の事実に反する仮定',
    "cosi": '',
    "accentContent": '★仮定法過去完了は過去の事実に反する仮定',
    "content": Text.rich(
      TextSpan(
        text: """
■仮定法過去完了
「もしあのとき～だったら」：
If ＋主語＋had＋過去分詞, 主語＋助動詞の過去形＋have＋過去分詞
または、
If＋助動詞の過去形＋have＋過去分詞, 主語＋助動詞の過去形＋have＋過去分詞

過去の事実に反する仮定です。意味としては過去の仮定なのですが、動詞は過去完了形を使うことに注意しましょう。

If I had been a genius , I could have solved this difficult problem easily.
（もし私が天才だったら、この難しい問題を簡単に解けただろうに。）

If I had had 30 million yen , I would have bought a house.
（もしも私が3,000万円もっていたら、家を買ったのに。）

If I could have quit smoking , I might have not become ill.
（もしも私がタバコをやめることができたなら、病気にならかったかもしれないのに。）

If it had not been for the sun , we could have not lived .
（もしも太陽がなかったら、私たちは生存できなかった。）

I wish I could met her .（彼女に会えたらよかったのに。）
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '仮定法の倒置はifが消える',
    "cosi": '■仮定法現在',
    "accentContent": '★仮定法の倒置はifが消える',
    "content": Text.rich(
      TextSpan(
        text: """
■仮定法現在

「万一～になったら」：
If ＋主語＋should＋動詞の原形, 主語＋should,would＋動詞の原形
または、
If ＋主語＋were to＋動詞の原形, 主語＋should,would＋動詞の原形

ほぼありえない未来の仮定を表します。

If the sun should rise in the west , I would never betray you.
（もしも太陽が西から昇るようなことがあっても、私は決してあなたを裏切らない。）

If the sun were to rise in the west , I would never betray you.
（もしも太陽が西から昇るようなことがあっても、私は決してあなたを裏切らない。）

shouldとwere toの違いについてですが、shouldは万が一でも可能性がありそうなことに使い、were toは可能性ゼロのときに使います。未来のことですから事実ではありませんので、可能性があるとかないとかは話し手・書き手がどう思っているかによって違ってきます。

仮定法はIfを使わず倒置で表されることがあります。倒置されても意味は変わりません。この倒置はTOEIC文法問題で頻出ですので覚えておきましょう。

If it were not for the sun , we could not live.
（もしも太陽がなければ、私たちは生存できない。）

を倒置すると、

Were it not for the sun , we could not live.

形としては「Ifがなくなって主語と動詞が入れ替わる」ということです。

If I had had 30 million yen , I would have bought a house.
（もしも私が3,000万円もっていたら、家を買ったのに。）

を倒置すると、

Had I had 30 million yen , I would have bought a house.
（もしも私が3,000万円もっていたら、家を買ったのに。）

動詞が過去完了形の場合はIfが消えて「had＋過去分詞」のHadと主語が入れ替わります。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '仮定法はセットで導く',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
また、ifを使わず、supposeという動詞を文頭にもってきて仮定法を導くことができます。

Suppose you had 10 million yen , what would you buy?
（1,000万円もっているとしたら、あなたは何を買いますか？）

その他にもIfを使わない仮定法として、without～やbut for～を使う場合があります。

Without the sun , we could not live.（もしも太陽がなければ、私たちは生存できない。）

But for the sun , we could not live.（もしも太陽がなければ、私たちは生存できない。）

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★仮定法はセットで導く',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

仮定法はなれないとちょっとややこしいですね。ちょっと頭を整理してみましょう。

例えば、

If I _______ a genius , I could solve this difficult problem easily.

Ａ）am
Ｂ）were
Ｃ）have been
Ｄ）had been

という問題があったら、「if節とカンマ後にcould solveか。仮定法過去だな。could solveは助動詞＋動詞の原形。この形とセットなのは過去形だからＢのwereだ」と考えることができます。

_______ I had 30 million yen , I would have bought a house.

Ａ）If
Ｂ）Because
Ｃ）Since
Ｄ）Had

という問題なら「カンマ後がwould have boughtか。仮定法過去完了の形だな。カンマ前はifを使うならIf I had hadにならなきゃいけないからＡはダメ。Ｄのhadなら倒置で形としても意味的にもおかしくない。」と考えることができます。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": '分詞構文は意味で判断する',
    "cosi": '分詞構文',
    "accentContent": '★分詞構文は意味で判断する',
    "content": Text.rich(
      TextSpan(
        text: """
分詞構文とは、現在分詞（～ing）や過去分詞（主に～ed）を使って接続詞のかわりにする用法です。「～なとき」「～なので」「～しながら」「～すれば」などの意味を表すことができます。このそれぞれの意味は文脈で判断しなければならないので慣れが必要になってきます。現在分詞は進行形のように「～している・～された」、過去分詞は受動態のように「～される・～された」というニュアンスがあります。

まずは接続詞を使った文をみてみましょう。

When he was playing tennis , he was tired.（テニスをしていたとき、彼は疲れていた。）

この文で接続詞ではなく分詞構文を使うと・・・

Playing tennis , he was tired. （テニスをしていたとき、彼は疲れていた。）

このようになります。Playingが現在分詞です。前半のほうの主語がなくなっていますね。分詞構文では2つの文の主語が同じときは省略するのです。「Playing tennis」の部分には時制を表す語がないのですが、「he was tired」のwasが過去形なので、「Playing tennis」の方も過去形の意味になります。

Shown the document , he couldn’t understand it.
（その書類を見せられたとき、彼はそれを理解できなかった。）

この文は過去分詞を使った例です。主語が省略されていますから、「Shown the documents」の主語はheですね。時制は「couldn’t」と同じく過去です。

Having played tennis yesterday, I’m tired today.
（昨日テニスをしたので、今日私は疲れている。）

分詞構文の時制をカンマ後の時制より前にしたいときは、この文のように「having＋過去分詞」を使います。ちなみに、この用法は受動態の意味では使えませんのでご注意ください。

She answered me , watching TV.（彼女はテレビをみながら、私にこたえた。）

この文はカンマ後が分詞構文です。分詞構文はカンマ前でもカンマ後でも使えます。

Turning right , you will find the warehouse.（右に曲がれば、その倉庫が見つかります。）

分詞構文では「する」のか「される」かの意味が重要になってきます。

例えば、

_______ tennis , he was tired.

Ａ）He play
Ｂ）Playing
Ｃ）Being played
Ｄ）Played

という問題があったら、「彼はテニスをするのだから、ＢのPlayingだ。」と考えることができますし、

_______ the document , he couldn’t understand it.

Ａ）Read
Ｂ）Cut
Ｃ）Stole
Ｄ）Shown

という問題なら、「主語は省略されているからカンマ後と同じくheだ。ＡとＢは命令形だとしても過去分詞だとしても意味がおかしいし、Ｃも彼が盗まれただとおかしいし、彼は見せられただと意味が合うからＤだ。」と考えることができます。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '比較級は後回し',
    "cosi": '比較',
    "accentContent": '★比較級は後回し',
    "content": Text.rich(
      TextSpan(
        text: """
比較は、勉強しなくてもいいというわけではありませんが、出題頻度はあまり高くないので、スコアアップ戦略上は後回しにするとよいでしょう。

比較とは、「～よりも・・・」とか「～の中で1番・・・」、「～と同じくらい・・・」のように複数のものを比べて説明する方法です。

■比較級

He is taller than her.（彼は彼女よりも背が高い。）

「背が高い」という意味の形容詞tallにerがついてtallerとなっていますね。2つのものを比べるときは形容詞にerをつけてthan（～よりも）という語を続けます。形容詞によっては-erをつけずにmoreを使います。

He is much taller than her.（彼は彼女よりもずっと背が高い。）

「～よりも」という比較の意味を強めたいときはeven、far、much、stillなどの副詞を使います。これらの語で意味を強めることによって「ずっと～だ」という意味になります。

He is the taller of the two.（彼はその2人のうちで背の高いほうです。）

the比較級of the twoという使い方をすると、「2つのうちで～なほう」という意味になります。

The older we grow, the worse our memory becomes.
（年をとればとるほど私たちの記憶力は弱くなっていく。）

このようにthe比較級 , the比較級という使い方をすると「～すればするほど・・・」という意味になります。

形容詞によってはthanではなくtoを使って「～よりも」という比較を表すものがあります。

You are superior to him.（あなたは彼よりも優れている。）

I am inferior to her.（私は彼女より劣っている。）

He is five years senior to her.
（彼は彼女よりも年上です。）

She is three years junior to me.
（彼女は私よりも3歳年下です）

■最上級

He is the tallest in his class.（彼は彼のクラスの中で1番背が高い。）

3つ以上のものを比べて「～の中で1番」という意味にするときはthe＋形容詞estをつかいます。形容詞によっては-estをつけずにmostを使います。

■erやestをつけないで比較を表す形容詞

形容詞によってはerやestをつけずに、more（～よりも）、most（～の中で1番）を使うものもあります。語尾が－ful、－less、－ive、－ing、－able、－ousになっているものとか、その他にもありますので学習する中で身につけましょう。

She is more famous than him.（彼女は彼よりも有名だ。）

This is the most difficult question in the textbook.
（これはその教科書の中で最も難しい問題だ。）

■原級

He is as tall as her.（彼は彼女と同じくらいの背の高さだ。）

「～と同じくらい・・・」という場合はasで形容詞か副詞をはさみます。

He is as tall as her.（彼は彼女と同じくらい背が高い。）

He is not as tall as her.（彼は彼女ほどは背が高くありません。）

notを入れると「～ほど・・・ではない」という意味になります。

I don’t watch TV as often as her.（私は彼女ほどよくテレビをみません。）

■熟語

比較には熟語的な用法がたくさんあります。

as～as・・・can＝as～as possible　（できるだけ～）

She read the book as fast as she could.（彼女はできるだけ速くその本を読んだ。）

She read the book as fast as possible. （彼女はできるだけ速くその本を読んだ。）

as～as any・・・（どの・・・にも劣らず～）

He is as beautiful as any woman in the company.
（彼女はその会社のどの女性にも劣らず美しい。）

as～as ever（相変わらず～）

She is as pretty as ever.（彼女は相変わらずかわいい。）

not so much Ａ as Ｂ＝more Ｂ than Ａ＝Ｂ rather than Ａ（ＡというよりはむしろＢ）

He is not so much clever as cunning.（彼は賢いというよりもむしろズルい。）

He is more cunning as clever. （彼は賢いというよりもむしろズルい。）

He is cunning rather than clever. （彼は賢いというよりもむしろズルい。）

not so much as 動詞（～さえしない）

She cannot so much as solve the easy question.
（彼女はその簡単な問題を解くことさえできない。）

（数）times as ～ as・・・（・・・の数倍～）

You have two times as many books as She.（あなたは彼女の2倍の数の本を持っている。）

比較級and比較級（ますます～）

He is becoming more and more strong.（彼はますます強くなってきている。）

prefer Ａ to Ｂ（ＢよりもＡの方を好む）

I prefer cats to dogs.（私は犬より猫の方が好きだ。）

no more than～＝only～（たった～しか）

He has no more than ＄1.（彼はたった1ドルしかもっていない。）

He has only ＄1.（彼はたった1ドルしかもっていない。）

not more than ～＝at most（せいぜい～・多くても～）

There were not more than six people in the room.
（せいぜい6人しかその部屋にはいなかった。）

There were six people in the room at most. （せいぜい6人しかその部屋にはいなかった。）

not less than～＝at least（少なくとも）

There were not less than six people in the room.（少なくとも6人はその部屋にいた。）

There were six people in the room at least. （少なくとも6人はその部屋にいた。）

no less than～＝as many as～＝as much as～（～も・～と同じだけの）

I have to run no less than 10 miles.（私は10マイルも走らなければならない。）

★言い換え例文挿入

the last～to＋動詞の原形（決して・・・しそうにない～）

He is the last man to become rich.（彼は決して金持ちになりそうにない男だ。）

second to none（誰にも劣らない）

She is second to none in diligence.（彼女ではまじめさでは誰にも劣らない。）

know better than to＋動詞の原形（～するほど愚かではい）

He knows better than to hit her.（彼は彼女をぶつほど愚かではない。）
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '特殊構文はパターンで覚える',
    "cosi": '特殊構文',
    "accentContent": '★特殊構文はパターンで覚える',
    "content": Text.rich(
      TextSpan(
        text: """
特殊構文はとある語句の組み合わせで成り立っています。パターンを覚えてしまいましょう。

■It ＋動詞（be動詞または知覚動詞）＋for＋人＋to＋動詞の原形

Itを仮の主語にした構文です。to以下が本当の主語なのですが、主語が長いと文が読みにくいのでitという仮の主語を置いています。

It seems difficult for her to win the award.（彼女がその賞を獲得するのは難しいようだ。）

forを省略したときは「一般的に」というニュアンスで文を理解すればいいでしょう。

It is difficult to win the award.（その賞を獲得するのは難しい。）

■強調構文

It ＋be動詞＋強調する語＋that～

be動詞の次に続く語が強調されます。

It is English that I study everyday.（私が毎日勉強しているのは英語です。）

この文では名詞Englishが強調されています。

It was then that she noticed the change.
（彼女がその変化に気づいたのはそのときだった。）

この文では副詞thenが強調されています。

■There＋be動詞＋主語

「There＋be動詞＋主語」で「主語があります」という意味になります。

There is a pen on the table.（そのテーブルの上にペンがあります。）

■so～ that・・・（とても～なので・・・だ）

He was so tired that he couldn’t eat a meal.
（彼はとても疲れていたので食事もとれなかった。）

■感嘆文

感嘆文はWhatやhowを使って「なんて～なんだろう！」という意味を表します。

What a beautiful girl she is !（なんて美しい少女なんだろう！）

whatをつかったときは「What＋形容詞＋名詞＋主語＋動詞」の語順になります。

How clever you are !（あなたはなんて賢いんだろう！）

howをつかったときは「How＋形容詞＋主語＋動詞」の語順です。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '主語と動詞の数を揃える',
    "cosi": '数',
    "accentContent": '★主語と動詞の数を揃える',
    "content": Text.rich(
      TextSpan(
        text: """
数はTOEIC英文法の基本です。得点源ともなりうるので、がんばって取り組みましょう

■主語と動詞の数

主語が単数のときは動詞も単数。主語が複数のときは動詞も複数です。例えば、

He are cool.（×）

この文は、主語が単数のHeなのに動詞が複数形のareですから、誤りですね。

■動名詞と不定詞

動名詞や不定詞は単数形です。なので、それらが主語にきたら、動詞も単数です。

Playing tennis is good for the health.（テニスをすることは健康に良い。）

To play tennis is good for the health. （テニスをすることは健康に良い。）

2つの文とも動詞が単数のisですね。

■the number of～（～の数）とa number of～（たくさんの）

the number of～が主語にきたら動詞は単数です。

The number of restaurants in Tokyo has increased for five years.
（東京の飲食店の数はここ5年間増加してきている。）

a number of～（たくさんの）が主語なら動詞は複数です。

A number of restaurants in Tokyo have opened for five years.
（たくさんの飲食店がここ5年間東京にオープンしてきている。）

the number of～、a number of～ともに、ofの後には数えられる複数名詞がきます。restaurantsというように最後にsがついて複数形になっていますね。restaurantじゃダメです。

■another（形容詞：もうひとつの）

anotherの後の名詞は可算名詞（数えられる名詞）の単数形しかきません。

例）another paper （もう一枚の紙）

例外としてanother three plates（もう3枚のお皿）のように、threeやfewなどの数詞を伴っていれば複数形がくることもあります。

■other（もう一方の・ほかの）

ポイントは2つです。

ポイント1：otherは可算名詞も不可算名詞も修飾します。しかし、otherだけで名詞の単数形を修飾することはありません。

ポイント2：必ずany , some , no , many　などを伴います。

例）
any other questions （他の質問）
チェック！：anyを伴っている。可算名詞の複数形を修飾している。

some other time （いつかほかの時）
チェック！：someを伴っている。不可算名詞を修飾している。

many other things （ほかのこと）
チェック！：manyを伴っている。可算名詞の複数形を修飾している。

some other person （ほかの誰か）
チェック！：someを伴っている。可算名詞の単数形を修飾している。

■one of the～（～のうちの1つ）

one of the～の形の中では、～は必ず複数形です。

例）one of the men （男性の中の一人）

one of the～の「～」が複数形のmenですね。ただし、動詞は単数形になりますので注意しましょう。

One of the men was very tall.（男性のうちの一人はとても背が高かった）

menが複数形なので、動詞がwereなんじゃないか？と思いがちですが、違います。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '不可算名詞は最後にｓがつかない',
    "cosi": '',
    "accentContent": '★不可算名詞は最後にｓがつかない',
    "content": Text.rich(
      TextSpan(
        text: """
■可算名詞と不可算名詞

可算名詞と不可算名詞を覚えしょう。

可算名詞とは数えられる名詞、不可算名詞は数えることのできない名詞です。
TOEICでは不可算名詞の方がよく狙われます。頻出のものを覚えてしまいましょう。注意すべき不可算名詞には、

furniture（家具）,economics（経済学）,information（情報）,money（お金）, hair（髪）,
meat（肉） , news（ニュース）, experience（経験）,equipment（設備）,ice（氷）,
sugar（砂糖）, mail（郵便）, baggage（荷物）, luggage（荷物）,machinery（機械）

などがあります。不可算名詞は最後にｓがつきません。

例えば、「furnitures」とはなりません。

economics（経済学）やnews（ニュース）にはsがついていますが、もともとそういう
単語として覚えましょう。

また、可算名詞と不可算名詞を「数や量」で修飾する語句を覚えておくことも大切です。
可算名詞だけを修飾する語は、
many（たくさんの）、a few（ほんの少しの）、a couple of（ほんの少しの）、
several（いくつかの）、a number of（たくさんの）

不可算名詞だけを修飾する語は、

much（たくさんの）、a little（ほんの少しの）、a great deal of（たくさんの）、

可算名詞と不可算名詞の両方を修飾する語は、

some（いくらかの）、a lot of（たくさんの）、plenty of（たくさんの）

です。

また、可算名詞の単数形の前には必ず冠詞または代名詞の所有格がくることも覚えておきましょう。

This is a pen.（これはペンです）

This is my pen（これは私のペンです）

逆に、不可算名詞の前には冠詞がきません。

This is furniture.（これは家具です。）

代名詞の所有格はＯＫです。

This is my furniture.（これは私の家具です。）
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": 'almostは副詞なので名詞を修飾できない',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
■every（すべての） と each（それぞれの）

every と eachの後には動詞の単数形がきます。
ただし、each of the ～の形では、～には複数形がきます。
every 又は each が主語についていたら、動詞は単数。
each of the ～の場合も、～は複数で動詞は単数です。

例）

（○）every child （すべての子供）

（×）every children（すべての子供たち）

Each child is genius.（それぞれの子供が天才だ。）

この例では、動詞が単数のisになっていますね。

Each of the children is genius. （それぞれの子供が天才だ。）

この文では、ofの後に複数形がきています。そして、動詞は単数です。

■and （～と）

andでくっついている主語は複数形扱いになります。

English and Chinese are quite different languages.
（英語と中国語はまるで違った言語です）

では、eachやeveryとandが複合していたら、その場合は単数形扱いとなります。

Every boy and every girl has a pen.
（全ての少年と少女はペンを持っている）

主語はandでつながっていますが、動詞は単数のhasになっています。

■all

形容詞としてのallは複数形を修飾します。

（○）all members（全てのメンバー）
（×）all member

注：不可算名詞を修飾することもできます。

■会社名

会社名はsで終わっていても単数扱いです。

会社名は予想もつかない名前がでてくることがあるので、分かりにくいこともあると思いますが、固有名詞ですので大文字で始まっているのが特徴です。

Learning Solutions is a great company.
（ラーニングソリューションズ社は素晴らしい会社だ）

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：53：almostは副詞なので名詞を修飾できない',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """

almostはTOEIC英文法問題でよく出るので注意が必要です。

■almost（ほとんど）とmost（もっとも多くの・大部分の）

この2つは紛らわしいですね。

almostは副詞。
mostは副詞・名詞・代名詞・形容詞の働きをします。

almostは副詞なので名詞を直接修飾できないことに注意です。

（○）almost all people（ほとんど全ての人々）
（×）almost people

この例では、almostはallという形容詞を修飾しています。

それに対して、mostで注意すべきは、ofがついた場合です。

Most of them want to study abroad.（彼らの大多数は留学したがっている）

Most of her money is spent on clothing.（彼女のお金の大半は洋服に使われる）

most of ～となっている場合、～のところに単数形や不可算がきていれば動詞も単数、
複数形がきていれば動詞も複数扱いになります。

この例では、ofの後にthemがきているときはwant（wantsではない）、moneyという不可算名詞がきているときはis（areではない）になっていることに注目しましょう。
""",
              ),
            ],
          )
        ],
      ),
    ),
  },
  {
    "title": 'despiteはよく出る',
    "cosi": '前置詞',
    "accentContent": '★despiteはよく出る',
    "content": Text.rich(
      TextSpan(
        text: """
前置詞にはいろいろありますが、ここではTOEIC文法問題にでやすい用法をご紹介します。

その中でも、despiteという語はやたらと出題されます。

■despite（～にも関わらず）

despiteは、それ1語で「～にも関わらず」という意味です。

despite of という形はありません。こんな語句は誤りですので注意しましょう。

despiteの後には名詞（又は動名詞）がきます。

ちなみに、despite＝in spite of です。

■beside（～のそばに）とbesides（～のほかに・～に加えて）

この2つは見た目が似ていますが、意味が違います。しっかり、区別できるようにしましょう。

He stood beside the window.（彼は窓のそばに立っていた）

Besides being a scholar, he was a famous writer.
（彼は学者である上に有名な作家だった）

■by（～までに）とuntil（～まで）

byは「期限」を表し、untilは「継続」を表します。

I have to go back by ten o’clock.（私は10時までに帰らねばなりません）

byは10時までにという「期限」を表しますから、10時までであれば、8時に帰っても9時に帰ってもいいわけです。

I waited until three o’clock.（私は3時まで待っていた）

それに対しuntilは「継続」を表しますから、3時までず～っと待っていたわけですね。

このニュアンスの違いを理解して覚えましょう。
""",
        style: TextStyle(fontSize: Responsive.height18),
      ),
    ),
  },
  {
    "title": '意思表示動詞＋thatは動詞の原型を伴う',
    "cosi": '',
    "accentContent": '',
    "content": Text.rich(
      TextSpan(
        text: """
さて、この項で後です。ここまでで紹介しれきなかった重要ポイントをまとめましたので、がんばって取り組みましょう。

■ペアを覚える

これらの語句はセットで覚えてしまいましょう。

either A or B（ＡかＢのどちらか）
neither A nor B（ＡもＢのどちらも～ない）
both A and B （ＡとＢの両方）

セットというのは、eitherがきたら、それに対応するのはorということです。例えば、「either you nor Ｉ」とはならないということです。正しくはnorではなくorです。しっかり覚えましょう。

■形容詞

単体の形容詞ではなく、2つの語がくっついて形容詞化しているものは要注意です。その場合、ｓがつきません。

例）

（○）Three hundred dollars（300ドル）
（×）Three hundreds dollars

この場合、Three hundredという風に2つの語がくっついて形容詞化し、dollarsを
修飾していますね。その際にsがつかないということです。また、「－」（ハイフン）がついていることもありますので注意しましょう。

（○）a five – day week（週休2日）
（×）a five – days week

■名詞

名詞は基本的に2つ並びません。本来であれば形容詞が名詞を修飾していたり、動詞が名詞を目的語としてとるのが適切な形です。それを名詞で修飾させようとするヒッカケ問題がでたりします。

例）

（○）aggressive weapons （攻撃用兵器）
（×）aggressiveness weapons

この例では、本来、形容詞であるできaggressive が名詞化して2つ並んでいます。

例）

（○）postpone the meeting（会議を延期する）
（×）postponement the meeting

この例では、本来、動詞であるできpostpone が名詞化して2つ並んでいます。

■late（遅い）とlately（最近）

lateは形容詞・副詞で、latelyは副詞です。

この語は、用法よりも単純に意味の違いを覚えておきましょう。
見た目が似ているという理由だけでヒッカケようとする問題がでます。

■hard（固い・難しい）とhardly（ほとんど～ない）

hardは形容詞、hardlyは副詞です。
この語も、用法よりも単純に意味の違いを覚えておきましょう。

""",
        style: TextStyle(fontSize: Responsive.height18),
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: '★：意思表示動詞＋thatは動詞の原型を伴う',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height20,
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: """


■意思表示動詞

require（他動詞：必要とする）demand（他動詞：要求する）propose（他動詞：提言する）
suggest（他動詞：提案する）recommend（推薦する）insist（他動詞：主張する）
問題文中にこの6つの動詞のどれかを見つけたら注意しましょう。
これらの動詞は特別です。これらの動詞がthatを伴っているとき、その中の動詞は原形に
なります（shouldが省略されています）。これは、時制の一致の例外です。

例）

（○）The teacher recommended that we buy the novel.
（先生は私達にその小説を買うように勧めた）（buyの前にshouldが省略されています）

（×）The teacher recommended that we bought the novel.

■It is ～that・・・構文

It is ～that・・・の構文で、～の場所に次のような形容詞がはいると、that以下の節の動詞は原形になります。

crucial（重大な）, essential（不可欠な）, imperative（印象的な）, vital（大切な）

It was essential that we you win the voter’s hearts.
（有権者の心をつかむことが絶対に必要だった）

■前置詞

前置詞は2連続で並びません。

例）

（×）with for

また、前置詞の後には名詞（又は動名詞）がきます。
選択肢の中に動詞があっても、それは誤りです。

■等位接続詞

等位接続詞とは、その前後で、品詞が同じくなくてはならない接続詞です。

等位接続詞には次のようなものがあります。

and , but , than , as well as , or

I like to play tennis and baseball.（私はテニスと野球をするのが好きだ）

この例ではandの前後の品詞は、tennisもbaseball、も共に名詞ですから正しいです。
""",
              ),
            ],
          )
        ],
      ),
    ),
  }
];
