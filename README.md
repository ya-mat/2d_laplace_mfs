# 2d_laplace_msf

## 内容

2次元Laplace方程式に対する基本解法の初歩的なコードです．ライセンスは定めていませんが，学習のための利用を想定していますので，商売はしないでください．

README.mdには数式が書けないようなので，詳細な説明は省きますが，針金で作った境界の内部に張られるせっけんの膜の形を数値的に解いていると解釈してください．ただし，内点計算はしていません．

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
- うまくいくと，次のようになります
```
 # n, rad
 number of dof        1000
 rad  0.50000000000000000     
 relative error   3.1420249220739864E-003
```
- `input`の中身を編集することで，未知数の数と円の半径を変更できます．
