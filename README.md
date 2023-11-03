# emacs-lisp-vtable-multiple-textwrapped-columns

The idea was to use `vtable.el` to display multiple textwrapped columns which easily works using Python to wrap the content nicely.

Right now, highlighting ``` blocks is unsupported though and there are many other TODOs to make this work as nicely.

Plus one needs dynamic resizing based on window width.

## The big picture

Use this to display LLM answers instead of relying on HTML directly in Emacs with a dynamic window column resizing. Use 1 column for small window width, 3 columns for big window width, etc.
