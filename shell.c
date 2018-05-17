#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

#include "dcoreutil.h"

int run();

int main(int argc, char* argv[]) {
	printf("argc %d\n", argc);
	printf("argv %s\n", argv[0]);
	char input[255];
	while (1) {
		printf("\n> ");
		scanf("%s", input);
		printf("input %s\n", input);
		run(input);
	}

	return 0;
}

int run(const char* input) {

	int is_cmd = is_coreutil_command(input);
	
	if( is_cmd ) {
		printf("Is coreutil_command\n");
	}
	
	pid_t pid = fork();

	if (pid > 0) {
		printf("Waiting for %d\n", pid);
		int status;
		waitpid(pid, &status, 0);
	} else {
		printf("I am child\n");
		char* argv[0];
		int i = execvp(input, argv);
		printf("i %d\n", i);
	}

	return 0;
}
