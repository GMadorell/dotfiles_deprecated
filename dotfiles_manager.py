import click
import os

IGNORED_FOLDERS = {".git", "config_scripts", "backup"}
DOTFILES_DIR = os.path.expanduser(os.path.join("~", "dotfiles"))


@click.group()
def cli():
    pass


@cli.command(help="Links all the valid main directories.")
def link_all():
    for directory_name in get_valid_subdirectories():
        link_main_directory(directory_name)


@cli.command(help="Link the given 'names' directory files recursively, " +
                  "backing up existing files. Ex usage: link git r vim")
@click.argument("names", nargs=-1)
def link(names, link_directory=False):
    for name in names:
        link_main_directory(name)


def link_main_directory(name):
    assert check_valid_link_directory(name),\
        "Directory '{}' is not valid. Does it exist?".format(name)
    # Try to link full directories, in case they don't exist or are empty
    # in the target location.
    paths = get_dir_paths_for_directory(name)
    origin_destination_list = get_origin_destination_for_paths(name, paths)
    origin_destination_list.sort(key=lambda origin_destination: len(get_dir_splits(origin_destination[0])))

    dirs_not_linked = []
    while len(origin_destination_list) > 0:
        origin, destination = origin_destination_list.pop(0)
        if not os.path.exists(destination) \
            and count_amount_files_directory(destination) == 0:
            os.symlink(origin, destination)
            remove_deeper_paths(origin_destination_list, destination)

        elif os.path.exists(destination) and os.path.islink(destination):
            remove_deeper_paths(origin_destination_list, destination)
            
        elif not os.path.islink(destination):
            dirs_not_linked.append((origin, destination))

    # For all those directories that can't be linked because they already
    # existed, link the files inside them.
    for dir_origin, dir_destination in dirs_not_linked:
        filenames = [f for f in os.listdir(dir_origin) 
                     if os.path.isfile(os.path.join(dir_origin, f))]
        file_origins = map(lambda filename: os.path.join(dir_origin, filename), filenames)
        file_destinations = map(lambda filename: os.path.join(dir_destination, filename), filenames)
        
        for file_origin, file_destination in zip(file_origins, file_destinations):
            link_backing_up(file_origin, file_destination)
            
    click.echo("Linked '{}' main directory.".format(name))


def remove_deeper_paths(origin_destination_list, destination):
    for i in range(len(origin_destination_list)-1, -1, -1):
        origin2, destination2 = origin_destination_list[i]
        splits = get_dir_splits(destination)
        splits2 = get_dir_splits(destination2)
        for split in splits:
            if split not in splits2:
                break
        else:
            origin_destination_list.remove(origin_destination_list[i])


def count_amount_files_directory(directory):
    count = 0
    for path, children, files in os.walk(directory):
        count += len(files)
    return count


def get_link_origin_destination_for_directory(name):
    """ Returns a list of tuples (origin, destination) for all the
    links of the given 'name' main directory.
    Origin = dotfiles directory path (the file the link points to).
    Destination = place where the link shall be created."""
    file_paths = get_file_paths_for_directory(name)
    origin_destination_list = get_origin_destination_for_paths(name, file_paths)
    return origin_destination_list


def get_file_paths_for_directory(name):
    """ Returns a list of paths corresponding to the files inside the
    given 'name' main directory. """
    walk_results = list(os.walk(name))
    # Walk gives results such as 'name/directory', we are only interested
    # in the second part of that, so we remove 'name' from it.
    clean_walks = \
        map(lambda triple: (triple[0][len(name):], triple[1], triple[2]),
            walk_results)
    file_paths = []
    for directory, children, files in clean_walks:
        for file_name in files:
            splits = get_dir_splits(directory) + [file_name]
            file_path = os.path.join(*splits)
            file_paths.append(file_path)
    return file_paths

def get_origin_destination_for_paths(main_dir_name, paths):
    origin_destination_list = []
    for path in paths:
        splits = get_dir_splits(path)
        destination = os.path.expanduser(os.path.join("~", *splits))
        origin = os.path.join(DOTFILES_DIR, main_dir_name, *splits)
        origin_destination_list.append((origin, destination))
    return origin_destination_list


def get_dir_paths_for_directory(name):
    """ Returns a list of paths corresponding to the directories inside the
    given 'name' main directory. """
    subdirectories = [x[0] for x in os.walk(name)]
    subdirectories.pop(0)
    clean_subdirs = map(lambda dirname: dirname[len(name):], subdirectories)
    return clean_subdirs


@cli.command(help="Unlinks all the valid main directories.")
def unlink_all():
    for directory_name in get_valid_subdirectories():
        unlink_main_directory(directory_name)


@cli.command(help="Unlink the given 'names' directory files recursively." +
                  "Ex usage: link git r vim")
@click.argument("names", nargs=-1)
def unlink(names):
    for name in names:
        unlink_main_directory(name)


def unlink_main_directory(name):
    for origin, destination in get_link_origin_destination_for_directory(name):
        if os.path.islink(destination):
            os.unlink(destination)
    click.echo("Unlinked '{}' main directory.".format(name))


def check_valid_link_directory(name):
    valid_subdirectories = get_valid_subdirectories()
    return name in valid_subdirectories


def get_valid_subdirectories():
    subdirectories = [d for d in os.listdir(".") if os.path.isdir(d)]
    valid_subdirectories = \
        filter(lambda dir: dir not in IGNORED_FOLDERS, subdirectories)
    return valid_subdirectories


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
    @param destination: path where the link will be created
    """
    if os.path.exists(destination):
        backup_path = os.path.join(".", "backup", *get_dir_splits(destination))
        backup_file(destination, backup_path)
        os.unlink(destination)
    ensure_directory(destination)
    os.symlink(origin, destination)


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
