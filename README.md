trial-plantuml
==============

準備
----

以下のURLからjarファイルをダウンロードし、libディレクトリに格納する。

* [ダウンロードのページ](https://plantuml.com/ja/download)
* [Generation of PDF file](https://plantuml.com/ja/pdf)

実行
----

```sh
# PNG形式で出力する（デフォルト）
$ java -Djava.awt.headless=true -jar lib/plantuml-1.2022.3.jar sample.puml

# PDF形式で出力する
$ java -Djava.awt.headless=true -jar lib/plantuml-1.2022.3.jar sample.puml -tpdf
```

```sh
$ python3 -m http.server 20080
```
