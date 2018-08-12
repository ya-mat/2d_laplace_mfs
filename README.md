# 2d_laplace_msf

## 内容

2次元Laplace方程式に対する基本解法の初歩的なコードです．ライセンスは定めていませんが，学習のための利用を想定していますので，商売はしないでください．
[境界要素法のコード](https://github.com/ya-mat/2d_laplace)の姉妹版です．

## 必要なもの
- fortranコンパイラ
- blas
- lapack

## 使い方
- 好きなディレクトリにて次のコマンドを打つ
```
git clone git://github.com/ya-mat/2d_laplace.git
cd 2d_laplace
```
- `Makefile`を自分の環境に合うように編集する
    - `LINKER` fortranコンパイラを指定
    - `FORTRAN` fortranコンパイラを指定
    - `LDFLAGS` blas, lapackのpathを指定
- シェルで次のコマンドを打つ
```
make
./a.out
```

- `input`の中身を編集することで，未知数の数と円の半径を変更できます．
