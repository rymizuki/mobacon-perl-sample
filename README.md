mobacon-perl-sample
===================

# How to use

## install anyenv

```
$ git clone https://github.com/riywo/anyenv ~/.anyenv
$ echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.your_profile
$ echo 'eval "$(anyenv init -)"' >> ~/.your_profile
$ exec $SHELL -l
```

## install plenv

```
$ anyenv install plenv
$ exec $SHELL -l
$ plenv install 5.10.0 
```

## install cpanm

```
$ plenv install-cpanm
```

## install Carton

```
$ plenv exec cpanm Carton
```

## cloning this repo

```
$ git clone https://github.com/rymizuki/mobacon-perl-sample
$ cd mobacon-perl-sample
$ carton install
```

## Run apps

```
$ plackup -a app.psgi
```
