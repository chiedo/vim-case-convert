"Vim Case convert

" Converts Selected word's case
" - conversion: 'The name of the conversion'
" - skipconfirmation: If skipconfirmation is set to 1, then the user will not
"   be promted at each change.
" - start_line: The first line to search.
" - end_line: The last line to search
function! CaseConvertFunc(conversion, skip_confirmation, start_line, end_line, selection_only)

  " If the skip confirmation value is set to 1, then don't prompt the user at
  " each change.
  if a:skip_confirmation
    let modifiers= "ge"
  else
    let modifiers= "gec"
  endif

  if a:selection_only
    let selection_mod = '\%V'
  else
    let selection_mod = ''
  endif

  " Self explanitory
  if a:conversion == "CamelToHyphen"
    let search_for = '\(\<\u\l\+\|\l\+\)\(\u\)'
    let replace_with = '\l\1-\l\2'
  elseif a:conversion == "CamelToSnake"
    let search_for = '\(\<\u\l\+\|\l\+\)\(\u\)'
    let replace_with = '\l\1_\l\2'
  elseif a:conversion == "HyphenToCamel"
    let search_for = '\%(\%(\k\+\)\)\@<=-\(\k\)'
    let replace_with = '\u\1'
  elseif a:conversion == "HyphenToSnake"
    let search_for = '\%(\%(\k\+\)\)\@<=-\(\k\)'
    let replace_with = '\_\1'
  elseif a:conversion == "SnakeToCamel"
    let search_for = '\%(\%(\k\+\)\)\@<=_\(\k\)'
    let replace_with = '\u\1'
  elseif a:conversion == "SnakeToHyphen"
    let search_for = '\%(\%(\k\+\)\)\@<=_\(\k\)'
    let replace_with = '\-\1'
  endif
  
  " Execute the command
  exe a:start_line . "," . a:end_line . "s#" . selection_mod . search_for . "#" . replace_with . "#" . modifiers
  
endfunction

"Available commands
command! -range -bang CamelToHyphen call CaseConvertFunc("CamelToHyphen",<bang>0,<line1>,<line2>,0)
command! -range -bang CamelToSnake call CaseConvertFunc("CamelToSnake",<bang>0,<line1>,<line2>,0)
command! -range -bang HyphenToCamel call CaseConvertFunc("HyphenToCamel",<bang>0,<line1>,<line2>,0)
command! -range -bang HyphenToSnake call CaseConvertFunc("HyphenToSnake",<bang>0,<line1>,<line2>,0)
command! -range -bang SnakeToCamel call CaseConvertFunc("SnakeToCamel",<bang>0,<line1>,<line2>,0)
command! -range -bang SnakeToHyphen call CaseConvertFunc("SnakeToHyphen",<bang>0,<line1>,<line2>,0)

command! -range -bang CamelToHyphenSel call CaseConvertFunc("CamelToHyphen",<bang>0,<line1>,<line2>,1)
command! -range -bang CamelToSnakeSel call CaseConvertFunc("CamelToSnake",<bang>0,<line1>,<line2>,1)
command! -range -bang HyphenToCamelSel call CaseConvertFunc("HyphenToCamel",<bang>0,<line1>,<line2>,1)
command! -range -bang HyphenToSnakeSel call CaseConvertFunc("HyphenToSnake",<bang>0,<line1>,<line2>,1)
command! -range -bang SnakeToCamelSel call CaseConvertFunc("SnakeToCamel",<bang>0,<line1>,<line2>,1)
command! -range -bang SnakeToHyphenSel call CaseConvertFunc("SnakeToHyphen",<bang>0,<line1>,<line2>,1)

command! -range=% -bang CamelToHyphenAll call CaseConvertFunc("CamelToHyphen", <bang>0,<line1>,<line2>,0)
command! -range=% -bang CamelToSnakeAll call CaseConvertFunc("CamelToSnake", <bang>0,<line1>,<line2>,0)
command! -range=% -bang HyphenToCamelAll call CaseConvertFunc("HyphenToCamel", <bang>0,<line1>,<line2>,0)
command! -range=% -bang HyphenToSnakeAll call CaseConvertFunc("HyphenToSnake", <bang>0,<line1>,<line2>,0)
command! -range=% -bang SnakeToCamelAll call CaseConvertFunc("SnakeToCamel", <bang>0,<line1>,<line2>,0)
command! -range=% -bang SnakeToHyphenAll call CaseConvertFunc("SnakeToHyphen", <bang>0,<line1>,<line2>,0)
