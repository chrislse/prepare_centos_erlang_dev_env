#!/usr/bin/env ruby

plugins = {
  'DidYouMean'        => 'https://github.com/vim-scripts/DidYouMean.git',        
  'editorconfig-vim'  => 'https://github.com/editorconfig/editorconfig-vim.git', 
  'Figlet.vim'        => 'https://github.com/vim-scripts/Figlet.vim.git',        
  'incsearch.vim'     => 'https://github.com/haya14busa/incsearch.vim.git',      
  'lid'               => 'https://github.com/yegappan/lid.git',                  
  'nerdtree'          => 'https://github.com/scrooloose/nerdtree.git',           
  'tagbar'            => 'https://github.com/majutsushi/tagbar.git',             
  'vim-easytags'      => 'https://github.com/xolox/vim-easytags.git',            
  'vim-go'            => 'https://github.com/fatih/vim-go.git',                  
  'vim-hackernews'    => 'https://github.com/ryanss/vim-hackernews.git',         
  'vim-misc'          => 'https://github.com/xolox/vim-misc.git',                
  'vim-rubocop'       => 'https://github.com/ngmy/vim-rubocop.git',              
  'vim-ruby'          => 'https://github.com/vim-ruby/vim-ruby.git',             
  'vim-sensible'      => 'git://github.com/tpope/vim-sensible.git',              
  'vim-table-mode'    => 'https://github.com/dhruvasagar/vim-table-mode.git',    
  'YouCompleteMe'     => 'https://github.com/Valloric/YouCompleteMe.git',        
  'vim-elixir'        => 'https://github.com/elixir-lang/vim-elixir.git',        
  'command-t'         => 'https://github.com/wincent/command-t.git' 
}

dest_dir = '~/.vim'
plugins.each do |k, v|
  begin
    Dir.new("#{ENV['HOME']}/.vim/bundle/#{k}")
    puts "#{k} already cloned."
  rescue Errno::ENOENT => err
    puts `git clone #{v} #{dest_dir}/bundle/#{k} --recursive`
  end
end

begin
  Dir.new("#{ENV['HOME']}/.vim/bundle/YouCompleteMe/third_party/ycmd")
  puts 'YouCompleteMe already installed.'
rescue Errno::ENOENT => err
  you_complete_me = `cd #{dest_dir}/bundle/YouCompleteMe/ && ./install.sh`
end

commandt = `cd #{dest_dir}/bundle/command-t/ruby/command-t && ruby extconf.rb && make`

colorschool = `mkdir -p #{dest_dir}/colors && cd #{dest_dir}/colors && wget https://raw.githubusercontent.com/29decibel/codeschool-vim-theme/master/colors/codeschool.vim`
github = `mkdir -p #{dest_dir}/colors && cd #{dest_dir}/colors && wget https://raw.githubusercontent.com/endel/vim-github-colorscheme/master/colors/github.vim`
