import json
import os
import subprocess

from rich.console import Console

import tools

console = Console()


def run_create_symlinks(system, env):
	dir = '/home/john/.config/'
	with open('links.json', 'r') as f:
		data = json.load(f)

	## shared-configs ##
	tools.clear_screen()
	console.print('Symlink creation for shared-configs.', style='yellow')

	if check_symlinks('shared-configs'):
		for o, d in data['shared-configs'].items():
			if os.path.exists(dir + d):
				if os.path.islink(dir + d):
					print('- Skipped symlink for: ' + d)
				elif not os.path.islink(dir + d):
					replace = dir + d
					subprocess.run(replace, shell=True)
					print('- Replaced directory with symlink for: ' + d)
			elif not os.path.exists(dir + d):
				new_link = 'ln -s ' + o + ' ' + dir + d
				subprocess.run(new_link, shell=True)
				print('- Created symlink for: ' + d)
	else:
		console.print("\n[red]Skipped 'shared-configs' symlinks.[/red]")
	break_out = tools.cont()
	if break_out:
		return

	## symlinks for env
	tools.clear_screen()
	if env == 'hyprland':
		console.print(f'Symlink creation for {env}.', style='yellow')

		if check_symlinks(env):
			for o, d in data[system][env].items():
				if os.path.exists(dir + d):
					if os.path.islink(dir + d):
						print('- Skipped symlink for: ' + d)
					elif not os.path.islink(dir + d):
						replace = dir + d
						subprocess.run(replace, shell=True)
						new_link = 'ln -s ' + o + dir + d
						subprocess.run(new_link, shell=True)
						print('- Replaced directory with symlink for: ' + d)
				elif not os.path.exists(dir + d):
					new_link = 'ln -s ' + o + ' ' + dir + d
					subprocess.run(new_link, shell=True)
					print('- Created symlink for: ' + d)
		else:
			console.print(f"\n[red]Skipped '{env}' symlinks.[/red]")

	tools.complete()



def check_symlinks(links):
	choice = console.input(f"\n[yellow]Create symlinks for [blue]{links}[/blue] [red]'Y/n'[/red]:[/yellow] ").lower()
	if choice == 'y' or choice == '':
		return True
	else:
		return False
