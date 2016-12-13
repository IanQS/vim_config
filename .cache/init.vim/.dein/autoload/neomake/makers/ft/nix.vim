" vim: ts=4 sw=4 et
"
function! neomake#makers#ft#nix#EnabledMakers()
    return ['nix_instantiate']
endfunction

function! neomake#makers#ft#nix#nix_instantiate()
    return {
        \ 'exe': 'nix-instantiate',
        \ 'args': ['%:p', '--parse-only'],
        \ 'errorformat': 'error: %m at %f:%l:%c'
        \ }
endfunction

