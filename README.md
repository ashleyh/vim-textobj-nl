vim-textobj-nl
==============

**Please note that this plugin is currently only half-implemented (if that)**

Motion for "next/last object".  "Last" here means "previous", not "final".
Unfortunately the `p` motion was already taken for paragraphs.

Next acts on the next object of the given type, last acts on the previous
object of the given type.  These don't necessarily have to be in the current
line.

Currently works for `(`, `[`, `{`, and their shortcuts `b`, `r`, `B`. 

Some examples (C marks cursor positions, V means visually selected):

### `din'`: delete in next single quotes

```text
foo = bar('spam')
C
foo = bar('')
          C
```

### `canb`: change around next parens

```text
foo = bar('spam')
C
foo = bar
         C
```

### `vin"`: select inside next double quotes

```text
print "hello ", name
 C
print "hello ", name
       VVVVVV
```

Installation
------------

Depends on kana/vim-textobj-user.

If you have Vundle, you can use

```vim
Bundle 'kana/vim-textobj-user'
Bundle 'ashleyh/vim-textobj-nl'
```

Tests
-----

Run `./test/run.sh`. You will (hopefully) find yourself in vim with a screenful of test results.
The script will try to sort out the test dependencies for you.


Credit
======

I got the idea from [Steve Losh's vimrc][sjl-vimrc],
and adapted his comments into this `README`.

[sjl-vimrc]: https://bitbucket.org/sjl/dotfiles/src/2de1f78616fd1ecafa0b93fab9f03708d9dee39f/vim/vimrc?at=default#cl-1503
