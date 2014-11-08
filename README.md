# Dotfiles configuration files management
This repo holds my configuration files. They can be replicated using a custom tool inspired by gnu-stow tool.

## Creating links
The idea behind this project is to have a ~/dotfiles folder holding this repository contents. Then, instead of having the configuration files in their location, symlinks are created so all the configuration files are in that folder.

For example, say that we have the following config files that we want to store:

	~/
		.config/
			terminator/
				config
		.vim/
			[some files...]
		.vimrc

We would then need to create the following folders to manage them:

	~/
		dotfiles/
			vim/
				.vim/
					[some files...]
				.vimrc
			terminator/
				.config/
					terminator/
						config

Basically, we have one folder per tool settings and inside that folder we emulate the directory structure of the home folder.

Then, when we have moved the files, use the following to create the symlinks:
	
	cd ~/dotfiles
	python dotfiles_manager link vim
	python dotfiles_manager link terminator

We can also link more than one main directory using:

    python dotfiles_manager.py link vim terminator

We can also unlink the symlinks, and do operations to all the valid main directories:

    python dotfiles_manager.py unlink vim terminator
    python dotfiles_manager.py link_all
    python dotfiles_manager.py unlink_all

When we are installing the config files in a new computer, we can just download the repo and run the appropiate command for the configs we want.
