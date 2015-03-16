# Dotfiles
## Installation

### Install from git

```bash
git clone https://github.com/lexa-uw/dotfiles.git && cd dotfiles \
    && rsync -av --progress . ~/ \
        --exclude README.md --exclude LICENSE --exclude .git \
    && cd -
```

### Git-free install

To install these dotfiles with curl:

```bash
cd ~/; curl -#L https://github.com/lexa-uw/dotfiles/tarball/master \
    | tar -xzv --strip-components 1 --exclude={README.md,LICENSE} \
    && cd -
```
