import click
import subprocess
import re
import json
import os
from textwrap import dedent


@click.group()
def cli():
    pass

KEYBINDINGS_FOLDER = "org.gnome.desktop.wm.keybindings"

export_re = re.compile(r"(.+) (.+) (\[.+\])")


@cli.command()
@click.option("--file_path", type=click.Path(), default="keybindings.json")
def export_bindings(file_path):
    backup_file(file_path)
    raw_keybindings = \
        subprocess.check_output(["gsettings", "list-recursively",
                                 KEYBINDINGS_FOLDER])

    splitted = raw_keybindings.split("\n")
    splitted = filter(lambda kb_line: "@" not in kb_line, splitted)
    splitted = filter(lambda kb_line: len(kb_line) > 0, splitted)

    keybindings_list = []
    for keybinding in splitted:
        matches = export_re.match(keybinding)
        path, name, binding = matches.groups()

        keybindings_list.append({"gsettings_path": path,
                                 "name": name,
                                 "binding": binding})

    with open(file_path, "w") as json_file:
        jsonified = json.dumps(keybindings_list)
        json_file.write(jsonified)

    click.echo("Succesfully exported keybindings to {}".format(file_path))


def backup_file(file_path, backup_path=None, verbose=True):
    """
    If the given 'file_path' exists, this function creates a copy of it.
    Backup is done at 'backup_path'.backup# (backup_path defaults to
    'file_path'.
    If 'verbose' is set (defaults to True), prints output when backing up.
    """
    if not os.path.isfile(file_path):
        return
    if not backup_path:
        backup_path = file_path
    ensure_directory(backup_path)

    count = 1
    file_name_template = "{}.backup{}"
    backup_name = file_name_template.format(file_path, count)
    while os.path.isfile(backup_name):
        count += 1
        backup_name = file_name_template.format(file_path, count)

    with open(file_path) as original_file, \
            open(backup_name, "w") as backup_file:
        backup_file.write(original_file.read())

    if verbose:
        print(dedent("""\
            '{}' already found! Backing the file up to '{}' before doing
            any changes.""".format(file_path, backup_name)))


def ensure_directory(file_path):
    d = os.path.dirname(file_path)
    if d and not os.path.exists(d):
        os.makedirs(d)


@cli.command()
@click.option("--file_path", type=click.Path(), default="keybindings.json")
def import_bindings(file_path):
    with open(file_path, "r") as json_file:
        keybindings_list = json.load(json_file)

    for kb_dic in keybindings_list:
        dconf_path = "/{}/{}".format(
            kb_dic["gsettings_path"].replace(".", "/"), kb_dic["name"])
        binding = "\"{}\"".format(kb_dic["binding"])
        command = "dconf write {} \"{}\"".format(dconf_path, kb_dic["binding"])
        subprocess.check_output(["dconf", "write", dconf_path, binding])
        click.echo(command)

    click.echo("\nSuccessfully imported keybindings from {}".format(file_path))


if __name__ == '__main__':
    cli()
