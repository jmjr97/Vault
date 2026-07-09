import subprocess

from rich.console import Console

import tools

console = Console()


def install_yay():
	tools.clear_screen()
	console.print('This will install an Aur helper.\n', style='yellow')
	break_out = console.input("[blue]Would you like to continue [red]'Y/n'[/red]:[/blue] ").lower()
	if break_out: 
		return

	git_clone = 'git clone https://aur.archlinux.org/yay.git'
	subprocess.run(git_clone, shell=True)

	make_yay = 'yay/makepkg -si'
	subprocess.run(make_yay, shell=True)

	git_remove = 'rm -rf yay'
	subprocess.run(git_remove, shell=True)
	tools.complete()

if __name__ == '__main__':
	install_yay()
