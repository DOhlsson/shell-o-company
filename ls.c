#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <errno.h>
#include <string.h>

int main(int argc, char* argv[]) {
	const char* tdir = NULL;
	int show_hidden = 0;

	if (argc > 1) {
		for (int i = 1; i < argc; i++) {
			//printf("$%d = %s\n", i, argv[i]);
			if (strncmp(argv[i], "-a", 2) == 0) {
				show_hidden = 1;
			} else {
				tdir = argv[i];
			}
		}
	}

	if (tdir == NULL) {
		tdir = getenv("PWD");
	}

	DIR* dir = opendir(tdir);
	if (dir == NULL) {
		printf("opendir failed: %s\n", strerror(errno));
		return 1;
	}

	struct dirent* entry = readdir(dir);

	while (entry != NULL) {
		char* name = entry->d_name;
		if (name[0] == '.' && show_hidden) {
			printf("%s\n", entry->d_name);
		} else if (name[0] != '.') {
			printf("%s\n", entry->d_name);
		}
		entry = readdir(dir);
	}

	return 0;
}
