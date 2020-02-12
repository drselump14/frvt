# Face Recognition Vendor Test (FRVT) Validation Packages
This repository contains validation packages for all FRVT Ongoing evaluation tracks.
We recommend developers clone the entire repository and run validation from within
the folder that corresponds to the evaluation of interest.  The ./common directory
contains files that are shared across all validation packages.

## Installation with docker
Install the environment (Centos) and build the null implementation (11, 1N, morph, quality) with `docker-compose build`

## Run validation for each null implementation

For each null implementation, validation can be run as

```
docker-compose run 11 ./run_validate_11.sh
docker-compose run 1N ./run_validate_1N.sh
docker-compose run morph ./run_validate_morph.sh
docker-compose run quality ./run_validate_quality.sh
```

It will generate the report in artifacts directory

### Structure


NISTの1:1 の評価方法をもっと知りたいので、FRVTのソースコードを改めて読みました。
理解してきたことをまとめてここに書きます。

### 用語
- template: 画像のフィーチャーデータ (形式はcppのstd::vector, pythonのnumpyみたい)
- enroll: 学習用のファイルの登録のこと

### ファイルの構造

```
11
├── CMakeLists.txt
├── README.txt
├── input
│   ├── enroll.txt -> 学習用のファイルのリスト (奇数番号のテンプレート)
│   ├── match.txt -> 学習したファイルとその検証するためのテンプレートのペア
│   ├── short_enroll.txt -> enroll.txtのような役割が、短いバージョン
│   └── verif.txt -> 検証用のファイルのリスト (偶数番号のテンプレート)
├── run_validate_11.sh -> 環境構築、コンパイル、検証プロセスを開始するスクリプト
├── scripts
│   ├── build_null_impl.sh -> nullクラスの実装をビルドするスクリプト
│   ├── compile_and_link.sh -> 全体的のコンパイルするスクリプト
│   ├── count_threads.sh -> スレッドを起案するスクリプト
│   └── run_testdriver.sh -> 検証を開始するスクリプト
└── src
    ├── include
    │   └── frvt11.h -> 自作アルゴリズムの最低限に実装しないといけないinterface
    ├── nullImpl
    │   ├── CMakeLists.txt
    │   ├── nullimplfrvt11.cpp -> 実際のアルゴリズムの実装
    │   └── nullimplfrvt11.h -> frvt11.hを継承したインターフェス
    └── testdriver
        ├── CMakeLists.txt
        └── validate11.cpp -> 学習用(enroll)のtemplate作成、validation用のtemplate作成, 検証結果をファイルに出力するクラス

8 directories, 18 files
```
