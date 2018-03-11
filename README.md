**Vim-case-convert**  -  Update the case of your variables.
==================================
Makes switching between camel case, snake case and hyphenated variables quick. Great for conforming legacy code bases or code written by a developer who ignored the standards to the desired case.

Installation
------------------------
### Pathogen Install
1. Navigate to your **[VIM_ROOT]/bundle** directory in your local Vim setup
2. git clone https://github.com/chiedojohn/vim-case-convert.git


Usage
-------------------------
To convert the case, select a block of text in visual mode and the enter one of the following (Self explanatory) :

```
:CamelToHyphen
:CamelToSnake
:HyphenToCamel
:HyphenToSnake
:SnakeToCamel
:SnakeToHyphen
```

These commands switch the case in ALL lines spanned by the visual selection, also outside it. To limit conversion to visual selection contents use the following:

```
:CamelToHyphenSel
:CamelToSnakeSel
:HyphenToCamelSel
:HyphenToSnakeSel
:SnakeToCamelSel
:SnakeToHyphenSel
```

To convert all occurences in your document then run one of the following commands:

```
:CamelToHyphenAll
:CamelToSnakeAll
:HyphenToCamelAll
:HyphenToSnakeAll
:SnakeToCamelAll
:SnakeToHyphen
```

Add a bang (eg. :CamelToHyphen!) to any of the above command to bypass the prompts before each conversion.
You may not want to do that though as the plugin wouldn't know the different between variables or other text in your file.


License
------------------------------------------------------
Distributed under the same terms as Vim itself. See :help license.

Credits
-----------------------------------------------------
http://vim.wikia.com/wiki/Converting_variables_to_or_from_camel_case
