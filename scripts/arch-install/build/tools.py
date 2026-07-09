import subprocess

from rich.console import Console

console = Console()


def clear_screen():
	subprocess.run('clear', shell=True)


def cont():
	console.print('\nProcess complete.', style='yellow')
	check = console.input("[blue]Would you like to continue [red]'Y/n'[/red]:[/blue] ").lower()
	if check == 'y' or check == '':
		return False
	else:
		return True

def complete():
	console.print('\nProcess complete.', style='yellow')
	console.print('\n[yellow]Press [red]enter[/red] to return to main menu: [/yellow]')
	input()

def check_system():
	while True:  # select system
		choice = console.input('[yellow]Select System Number: [red]1[/red]. [blue]main-rig[blue], [red]2[/red]. [blue]archbook[/blue]: ')
		if choice == '1':
			return 'main-rig'
		elif choice == '2':
			return 'archbook'
		else:
			console.print('Invalid Input.\n', style='red')


def check_env():
	while True:  # select system
		choice = console.input('[yellow]Select Environment Number: [red]1[/red]. [blue]KDE Plasma[blue], [red]2[/red]. [blue]Hyprland[/blue]: ')
		if choice == '1':
			return 'plasma'
		elif choice == '2':
			return 'hyprland'
		else:
			console.print('Invalid Input.\n', style='red')
