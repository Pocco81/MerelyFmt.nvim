" GPL-3.0 License

" prevent the plugin from loading twice
if exists('g:loaded_merelyfmt') | finish | endif

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" Utils {{{
function! mfcmds#get_first_arg(...)
	return "".get(a:, 1, 1).""
endfunction
" }}}


" Test Availability {{{
" aa = available arguments

function! mfcmds#available_args_install() abort
	return luaeval('require("merelyfmt.utils.completion.aa_install").available_commands()')
endfunction

function! mfcmds#available_args_uninstall() abort
	return luaeval('require("merelyfmt.utils.completion.aa_uninstall").available_commands()')
endfunction
" }}}

" Tab Completion {{{
function! s:complete_args_install(arg, line, pos) abort
	return join(mfcmds#available_args_install(), "\n")
endfunction

function! s:complete_args_uninstall(arg, line, pos) abort
	return join(mfcmds#available_args_uninstall(), "\n")
endfunction
" }}}


" Interface {{{
command! -nargs=+ -complete=custom,s:complete_args_install MFInstall call v:lua.require("merelyfmt.main").main('install',mfcmds#get_first_arg(<f-args>))
command! -nargs=+ -complete=custom,s:complete_args_uninstall MFUninstall call v:lua.require("merelyfmt.main").main('uninstall',mfcmds#get_first_arg(<f-args>))
command! -nargs=0 MFList call v:lua.require("merelyfmt.main").main('list')
" }}}

let &cpo = s:save_cpo " restore after
unlet s:save_cpo

" set to true the var that controls the plugin's loading
let g:loaded_merelyfmt = 1
