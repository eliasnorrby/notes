# Notes

> The contents of my brain, at my fingertips.

Or at least that's what my idea for this project is. Maybe someday I'll think
of a better name than `notes`, but for now, I'll just stick with it and start
committing.

## The idea

I've picked up things here and there over the years. Some things I remember,
some I forget. Some I write down, some I don't. Some I write down twice because
I forgot about the first time. I'm becoming frustrated with the difficulties
involved in retrieving solutions to problems I've solved in the past. I'll
recognize the need for a specific command or pattern, only to scour three sets
of notes and whichever one of the repositories I worked in the last few weeks
for the right section of code to review or copy. I want these little post-its
of bit sized knowledge to be more easily retrieved.

My plan is to use a set of markdown documents, one for each topic, with
metadata stored in the frontmatter. I can use `fzf` as an interface to this
little database, allowing quick access to medium-form documentation and
shortcuts for copying useful snippets and whatnot.

To try it out, clone this repo to `~/notes` and launch `notes_entry.sh`. Filter
notes with input, press enter to open the selected one (in `$EDITOR`) or create
a new note if there is no match. If the note has a snippet tied to it, it will
be shown in the top of the preview window. Copy it with `ctrl-y`.

## Dependencies

- `fzf`
- `yq`
- `bat`
