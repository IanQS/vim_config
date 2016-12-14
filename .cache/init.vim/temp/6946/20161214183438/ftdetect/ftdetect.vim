autocmd BufNewFile,BufRead *.Rout set ft=rout
autocmd BufNewFile,BufRead *.Rout.save set ft=rout
autocmd BufNewFile,BufRead *.Rout.fail set ft=rout
" recognize .snippet files
if has("autocmd")
    autocmd BufNewFile,BufRead *.snippets setf snippets
endif
autocmd BufNewFile,BufRead *.org setfiletype org
"autocmd BufNewFile,BufReadPost org:todo* setfiletype orgtodo
autocmd BufNewFile,BufRead *.json setlocal filetype=json
autocmd BufNewFile,BufRead *.jsonp setlocal filetype=json
autocmd BufNewFile,BufRead *.geojson setlocal filetype=json
