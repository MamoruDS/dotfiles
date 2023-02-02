#!/usr/bin/env sh

{{#if is_executable "vim"}}
export EDITOR=vim

{{/if}}
{{#if is_executable "nvim"}}
export EDITOR=nvim

{{/if}}
{{#if is_executable "bat"}}
export PAGER=bat

{{/if}}
{{#if is_executable "nvimpager"}}
export PAGER=nvimpager

{{/if}}
{{#if (or (is_executable "gpg") (is_executable "gpg2"))}}
export GPG_TTY=$(tty)

{{/if}}
