import click
import os

IGNORED_FOLDERS = {".git", "config_scripts", "backup"}
DOTFILES_DIR = os.path.expanduser(os.path.join("~", "dotfiles"))


@click.group()
def cli():
    pass


@cli.command(help="Link the given 'names' directory files recursively, " +
                  "backing up existing files. Ex usage: link git r vim")
@click.argument("names", nargs=-1)
def link(names):
    for name in names:
        link_single_directory(name)


def link_single_directory(name):
    assert check_valid_link_directory(name),\
        "Directory '{}' is not valid. Does it exist?".format(name)
    click.echo(name)
    walk_results = list(os.walk(name))
    # Walk gives results such as 'name/directory', we are only interested
    # in the second part of that, so we remove 'name' from it.
    clean_walks = \
        map(lambda triple: (triple[0][len(name):], triple[1], triple[2]),
            walk_results)
    for directory, children, files in clean_walks:
        for file_name in files:
            splits = get_dir_splits(directory) + [file_name]
            file_path = os.path.join(*splits)
            destination = os.path.expanduser(os.path.join("~", file_path))
            origin = os.path.join(DOTFILES_DIR, name, file_path)
            link_backing_up(origin, destination)


def check_valid_link_directory(name):
    subdirectories = [d for d in os.listdir(".") if os.path.isdir(d)]
    valid_subdirectories = \
        filter(lambda dir: dir not in IGNORED_FOLDERS, subdirectories)
    return name in valid_subdirectories


def get_dir_splits(directory):
    # Return the directory splitted by /
    splits = []
    head = directory
    while True:
        head, tail = os.path.split(head)
        if tail and tail not in splits:
            splits.insert(0, tail)
        if head and head not in splits:
            splits.insert(0, head)
        if not tail or not head:
            break
    clean_splits = filter(lambda split: "/" not in split, splits)
    return clean_splits


def link_backing_up(origin, destination):
    """
    @param origin: path to file being linked to
    @param destination: pah where the link will be created
    """
    if os.path.exists(destination):
        backup_path = os.path.join(".", "backup", *get_dir_splits(destination))
        backup_file(destination, backup_path)
        os.unlink(destination)
    ensure_directory(destination)
    os.symlink(origin, destination)
    pass


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
    backup_name = file_name_template.format(backup_path, count)
    while os.path.isfile(backup_name):
        count += 1
        backup_name = file_name_template.format(backup_path, count)

    with open(file_path) as original_file, \
            open(backup_name, "w") as backup_file:
        backup_file.write(original_file.read())

    if verbose:
        print(("'{}' already found! Backing the file up to '{}' before doing "
               "any changes.").format(file_path, backup_name))


def ensure_directory(file_path):
    d = os.path.dirname(file_path)
    if d and not os.path.exists(d):
        os.makedirs(d)

if __name__ == "__main__":
    cli()
