# git-poule Public Refresh Design

## Goal

Prepare `git-poule` for a public GitHub repository with a cleaner project surface, a playful GitHub Pages landing page, and clearer success/failure terminal feedback.

## User-Facing Behavior

### Command

`git poule` continues to wrap `git pull "$@"`.

On successful pull:

- Preserve the existing `git pull` output.
- Play a chicken-like sound when possible.
- Print a happy chicken ASCII art.
- Exit with status `0`.

On failed pull:

- Preserve the existing `git pull` output.
- Do not play any sound.
- Print a KO chicken ASCII art.
- Exit with the exact non-zero status returned by `git pull`.

## Public Repository Cleanup

The repository should be presentable as a small public open-source tool:

- Add `.gitignore` entries for local brainstorming artifacts such as `.superpowers/`.
- Keep shell tests in `test/`.
- Improve `README.md` so it explains the joke and the real behavior quickly.
- Add a permissive `LICENSE` file using MIT.
- Do not commit temporary brainstorming files or local generated state.

## GitHub Pages Landing

Use a no-build static site served directly by GitHub Pages:

- `index.html`
- `styles.css`
- `assets/` for visual assets

The landing style follows the chosen visual direction: "Startup Poulailler".

Visual requirements:

- Funny blue-white-red chicken mascot.
- Big French Tech parody energy.
- Strong first-viewport signal for `git-poule`.
- Real product content immediately visible: install command, `git poule` usage, and terminal behavior.
- No framework, no build step, no package manager.
- Responsive layout for mobile and desktop.

Content direction:

- Hero headline around "Unicorn? Non. Poule."
- Explain that this is `git pull` with poultry-grade feedback.
- Show success and KO examples.
- Add a footer credit:
  - Name: Alexandre Enouf
  - Website: `https://alexandre-enouf.fr`
  - Short comic message in the tone of the site.

## Visual Asset Strategy

Use a local generated bitmap mascot in `assets/` so the site has a real visual asset without depending on remote images.

The mascot should be a playful tricolor chicken, not a logo lockup. The page can also use CSS for layout, flags, terminal panels, and decorative interface details.

## Testing

Command tests:

- Success still forwards arguments and calls the sound helper.
- Failure preserves the non-zero exit status.
- Failure prints KO chicken output.
- Failure does not call the sound helper.

Static site checks:

- `index.html` references `styles.css`.
- Landing includes install command, KO state, footer name, and footer website.
- Referenced local assets exist.

## Out of Scope

- Publishing to GitHub Pages from this session.
- Creating a package manager release.
- Changing global Git configuration.
- Installing `git-poule` globally without explicit approval.
