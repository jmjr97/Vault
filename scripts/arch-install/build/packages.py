import json
import subprocess

from rich.console import Console

import tools

console = Console()

pac_cmd = 'sudo pacman -S --needed '
break_out = False

def run_install_packages(env):
	with open('packages.json', 'r') as f:
		data = json.load(f)
	tools.clear_screen()

	## update
	console.print('\nLets update the system before proceeding.', style='yellow')
	subprocess.run('sudo pacman -Syu', shell=True)
	break_out = tools.cont()
	if break_out:
		return

	## install utilities
	tools.clear_screen()
	console.print('Installing Utility Packages:', style='yellow')
	install_packages('utility', data)
	break_out = tools.cont()
	if break_out:
		return

	## install fonts
	tools.clear_screen()
	console.print('Installing Font Packages:', style='yellow')
	install_packages('fonts', data)
	break_out = tools.cont()
	if break_out:
		return

	## install apps
	tools.clear_screen()
	console.print('Installing Application Packages:', style='yellow')
	install_packages('apps', data)
	break_out = tools.cont()
	if break_out:
		return

	## instal env
	tools.clear_screen()
	if env == 'plasma':
		console.print('Installing KDE Plasma Packages:', style='yellow')
		install_packages('plasma', data)
		break_out = tools.cont()
		if break_out:
			return

	elif env == 'hyprland':
		console.print('Installing Hyprland Packages:', style='yellow')
		install_packages('hyprland', data)

	tools.complete()

## functions ##
def install_packages(package_cat, data):
	packages = ''
	for p in data[package_cat]:
		packages += p + ' '

	console.print(packages, style='red')
	choice = console.input("\n[blue]Install listed packages? [red]'Y/n'[/red]:[/blue] ").lower()
	if choice == 'y' or choice == '':
		install = pac_cmd + packages
		subprocess.run(install, shell=True)
	else:
		console.print('Pack installation skipped.', style='red')
