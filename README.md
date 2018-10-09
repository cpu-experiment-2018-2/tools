# tools
submoduleとしてシュミレーションに必要な各リポジトリが追加されている
* 初期化
```
make init
```
する.

* 各submoduleをorigin masterにする
```
make update
```

* file.mlをコンパイルしシュミレータに流す
```
make run file=foo.ml
```

* file.ml.sとかfile.ml.s.txtを消す
```
make clean
```

