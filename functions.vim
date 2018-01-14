" Functions

function! TrimWhiteSpace()
  silent! %s/\s\+$//
  ''
:endfunction

function! CollapseMultipleBlankLines()
  silent! g/^\_$\n\_^$/d
  ''
:endfunction

function! RemoveBindingPry()
  silent! g/binding\.pry/d
  ''
:endfunction

function! OpenGemFile()
  execute ':tabfind Gemfile'
endfunction

function! OpenRoutes()
  execute ':tabfind routes.rb'
endfunction

function! OpenFactories()
  execute ':tabfind factories.rb'
endfunction
