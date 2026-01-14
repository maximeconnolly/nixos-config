{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      lightline-vim
      nerdtree
    ];
    extraConfig = ''
      set nocompatible
      syntax on
      filetype plugin indent on
      
      " Lightline configuration
      set laststatus=2
      set noshowmode " Hide default mode text (e.g. -- INSERT --) as lightline shows it
      let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

      " NERDTree configuration
      map <C-n> :NERDTreeToggle<CR>
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    '';
  };
}
