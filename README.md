# tools
submoduleとしてシュミレーションに必要な各リポジトリが追加されている
* 初期化
```
make init
```
する.

* 各submoduleを最新のものにする(origin masterにする).
```
make update
```

* foo.mlをコンパイルしバイナリを得る
```
make bin file=foo.ml
```
foo.ml.s.ooに出力されるはず

* foo.mlをコンパイルしシュミレータに流す
```
make simulate file=foo.ml
```

* file.ml.sとかfile.ml.s.txtを消す
```
make clean
```

