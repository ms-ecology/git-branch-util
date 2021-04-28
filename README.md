# git-branch-util

git branch utils for myshell.

## Install

before install, you must install [myshell](https://github.com/ms-ecology/myshell) first.

```sh
npm i myshell -g
```

add git-branch-util:

```sh
ms add git-branch-util
```

## Usage

### cfb

create a branch.

```sh
ms cfb feat-add-util # create a branch named feat-add-util and push it to remote.
```

### mfb

merge current branch into target branch

```sh
git branch # *feat-add-util
ms mfb master # merge feat-add-util into master
```

### dfb

delete a branch and its remote branch

```sh
ms dfb feat-add-util # delete feat-add-util and origin/feat-add-util.
```
