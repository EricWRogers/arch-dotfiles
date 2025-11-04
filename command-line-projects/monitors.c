// cli.c
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>

// Your supported commands
static const char *kCmds[] = { "help", "default-single-screen", "hp-laptop-wacom", "hp-mirror-1080p", "oryx-office-ultrawide", "oryx-mirror-tv-wacom", "oryx-wacom-mirror-tv", "quit", NULL };

// generator for command matches
static char *cmd_generator(const char *text, int state) {
    static size_t idx, len;
    if (state == 0) { idx = 0; len = strlen(text); }
    for (; kCmds[idx]; idx++) {
        if (strncmp(kCmds[idx], text, len) == 0)
            return strdup(kCmds[idx++]); // readline frees this
    }
    return NULL;
}

// completion hook
static char **my_completion(const char *text, int start, int end) {
    (void)end;
    // If completing first word, use our command list.
    // Otherwise fall back to filename completion.
    if (start == 0) {
        rl_attempted_completion_over = 1;
        return rl_completion_matches(text, cmd_generator);
    } else {
        return rl_completion_matches(text, rl_filename_completion_function);
    }
}

int copy_paste(const char* _source, const char* _target) {
    char command[1024];
    snprintf(command, sizeof(command), "cp %s %s", _source, _target);

    int ret = system(command);
    if (ret == -1) {
        perror("system");
        return 1;
    }
}

int main(void) {
    rl_attempted_completion_function = my_completion;
    using_history();

    char *line;
    while ((line = readline("monitors> ")) != NULL) {
        if (*line) add_history(line);

        if (strcmp(line, "quit") == 0) {
            free(line);
            break;
        } else if (strcmp(line, "help") == 0) {
            puts("Commands: help, default-single-screen, hp-laptop-wacom, hp-mirror-1080p, oryx-office-ultrawide, quit");
        } else if (strcmp(line, "default-single-screen") == 0) {
            copy_paste("~/.arch-dotfiles/hyprland/.config/hypr/monitors_backup.conf", "~/.arch-dotfiles/hyprland/.config/hypr/monitors.conf");
            break;
        } else if (strcmp(line, "hp-laptop-wacom") == 0) {
            copy_paste("~/.arch-dotfiles/hyprland/.config/hypr/laptop-wacom.conf", "~/.arch-dotfiles/hyprland/.config/hypr/monitors.conf");
            break;
        } else if (strcmp(line, "hp-mirror-1080p") == 0) {
            copy_paste("~/.arch-dotfiles/hyprland/.config/hypr/mirror-single-monitors.conf", "~/.arch-dotfiles/hyprland/.config/hypr/monitors.conf");
            break;
        } else if (strcmp(line, "oryx-office-ultrawide") == 0) {
            copy_paste("~/.arch-dotfiles/hyprland/.config/hypr/oryx-office-ultrawide.conf", "~/.arch-dotfiles/hyprland/.config/hypr/monitors.conf");
            break;
        } else if (strcmp(line, "oryx-mirror-tv-wacom") == 0) {
            copy_paste("~/.arch-dotfiles/hyprland/.config/hypr/oryx-mirror-tv-wacom.conf", "~/.arch-dotfiles/hyprland/.config/hypr/monitors.conf");
            break;
        } else if (strcmp(line, "oryx-wacom-mirror-tv") == 0) {
            copy_paste("~/.arch-dotfiles/hyprland/.config/hypr/oryx-wacom-mirror-tv.conf", "~/.arch-dotfiles/hyprland/.config/hypr/monitors.conf");
            break;
        } else if (*line) {
            printf("Unknown: %s\n", line);
        }

        free(line);
    }
    puts("Bye!");
    return 0;
}

