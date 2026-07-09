import subprocess
import sys

from rich.console import Console
from rich.text import Text

import aur
import packages
import symlinks
import tools

console = Console()


def main():
	# progress trackers
	ip = ''
	cs = ''
	yay = ''

	print_logo()

	system = tools.check_system()
	env = tools.check_env()

	while True:
		subprocess.run('clear', shell=True)
		print_logo()
		console.print(f'System: [yellow]{system}[/yellow]', style='blue')
		console.print(f'Environment: [yellow]{env}[/yellow]\n', style='blue')

		## options ##
		console.print(f'  [red]1[/red] - Install Packages. [green]{ip}[/green]', style='yellow')
		console.print(f'  [red]2[/red] - Create Symlinks. [green]{cs}[/green]', style='yellow')
		console.print(f'  [red]3[/red] - Install Aur Helper. [green]{yay}[/green]', style='yellow')
		console.print('  [red]4[/red] - Exit.', style='yellow')
		choice = console.input('\n[yellow]Selection: [/yellow]')

		match choice:
			case '1':
				ip = ''
				packages.run_install_packages(env)
			case '2':
				cs = ''
				symlinks.run_create_symlinks(system, env)
			case '3':
				yay = ''
				aur.install_yay()
			case '4':
				sys.exit()
			case _:
				console.print('Invalid Selection.', style='red')
				console.input('\n[yellow]Press [red]Enter[/red] to continue.[/yellow]')


def print_logo():
	logo = Text(
		r"""
   ___           __     ___      _          __       ____
  / _ | ________/ /    / _ \___ (_)__  ___ / /____ _/ / /
 / __ |/ __/ __/ _ \  / , _/ -_) / _ \(_-</ __/ _ `/ / / 
/_/ |_/_/  \__/_//_/ /_/|_|\__/_/_//_/___/\__/\_,_/_/_/  
======================================================
""",
		style='blue',
	)
	console.print(logo, style='red')


if __name__ == '__main__':
	main()
