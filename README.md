dRungekutta4
============
Abstarct Rungekutta4 function for dlang.

How to use
============
まず初めにimportします。

```dlang
import rk4;
```

次にRunge-Kutta4用の関数を自分で定義します。
この例は適当です。

```dlang
double f1(double[] phase, double[] params) { return phase[3]; }
double f2(double[] phase, double[] params) { return phase[4]; }
double f3(double[] phase, double[] params) { return phase[5]; }
double f4(double[] phase, double[] params) { return phase[0]; }
double f5(double[] phase, double[] params) { return phase[1]; }
double f6(double[] phase, double[] params) { return phase[2]; }
```

それらの関数へのデリゲートを作ります。

```dlang
double delegate(double[], double[]) fp[6];
fp[0] = &f1; fp[1] = &f2; fp[2] = &f3;
fp[3] = &f4; fp[4] = &f5; fp[5] = &f6;
```

刻み幅と、更新したい要素、その他追加で渡したい引数を設定します。

```dlang
double h = 0.001;
double[] particle = [1.0, 1.0, 0.0, -1.0, 0.0, 2.0];
double[] params = [1.0];
```

ルンゲクッタ法で更新したい要素の数は何個でも良いですが、定義した関数の数と一致している必要があります。
paramsに関してはそのまま渡されるだけので好きなものを入れてください。
paramsが必要ない場合には空の配列を定義してください。

最後に、rungekutta4関数を呼び出します。
TemplateArgumentParameterは数値型を指定してください。

```dlang
double[] res = rungekutta4!(double[])(h, fp, particle, params);
```

これで1ステップ分更新された値がresに返ります。

動機
===========
D言語を真面目に学んでみたらいい感じだったので研究に使いたかった。
D言語歴3日くらいなので間違ってたらがしがしツッコミをお願いします。

LICENCE
===========
MIT
