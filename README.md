# Vimple

Welcome to my Vim setup, where Vim and Simple combine to create Vimple—
a straightforward yet powerful IDE-like experience that's reliable and very functional.

## Support for the XDG Base Directory Specification

[2024-04-18] [Patch 9.1.327](https://github.com/vim/vim/commit/c9df1fb35a1866901c32df37dd39c8b39dbdb64a) brings
support for the freedesktop [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html) and has
now been merged. A few more adjustments have been made with the following
patches: [v9.1.0337](https://github.com/vim/vim/commit/d1068a2bb09fd3b9d117d832105bf10dd5e48e2f) and
[9.1.345](https://github.com/vim/vim/commit/a34ba821076476a68e0e579723d68e896f771ba6). That means, you can now
place your configuration files under `~/.config/vim/` instead of `~/.vim` so Vim
will stop littering your home directory.

**Note:** To make this change backwards compatible, Vim will only attempt to
source from that location, if `~/.vim/vimrc` and `~/.vimrc` file do not exist.
So it won't impact existing users, but users that want to start using the new
location, will need to move their existing configuration to the new place. You
can also read about it at [:h xdg-base-dir](https://vimhelp.org/starting.txt.html#xdg-base-dir)

## Preparation

1. Download Vim (not Neovim).
2. Download Node.js.
3. Create the necessary directories:

   ```bash
   mkdir -p ~/.config/vim ~/.config/vim/autoload ~/.config/vim/backup ~/.config/vim/plugged ~/.config/vim/snippets
   ```

4. Download and install **Vim Plug**:

   - [Vim Plug GitHub](https://github.com/junegunn/vim-plug)

   ```bash
   curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

5. Copy the provided `vimrc` file or parts from it to your `$HOME/.config/vim` or `~/.config/vim` directory.
6. Open Vim, ignore any startup errors, and run:

   ```
   :PlugInstall
   ```

7. Close and reopen Vim.
8. Configure the `vimrc` file to suit your style and needs.
9. Download and install nerd font:

   - [Download Meslo nerd font](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k)
   - set your terminal to use newly installed meslo font.

10. Download and install Universal-ctags needed for gutentags plugin.

- [Universal-ctags](https://github.com/universal-ctags/ctags)

## Using Coc for Completion

### Prerequisites

1. To match the formatting and linting settings in the configuration, you will need to install the following Python packages:

- **Black** (formatter): `pip install black`
- **Flake8** (linter): `pip install flake8`

2. Use the provided `coc-settings.json` and put it inside `~/.config/vim/`

3. I have provided a customized 'solarized.vim' file in [custom_color scheme_lightline/solarized.vim](https://raw.githubusercontent.com/Blingoose/vimple_vimrc_config/main/custom_color%20scheme_lightline/solarized.vim)
   Copy this provided colorscheme instead of the original 'solarized.vim' which can be found at:
   /Users/{userAccountName}/.config/vim/plugged/lightline.vim/autoload/lightline/colorscheme

### Installation of CoC Extensions

Inside Vim, enter the following command to install necessary CoC extensions:

```
:CocInstall coc-json coc-vimlsp coc-pyright coc-tsserver coc-eslint coc-prettier coc-html coc-css coc-emmet coc-markdownlint coc-yaml coc-highlight
```

For more information, visit the [Coc.nvim GitHub repository](https://github.com/neoclide/coc.nvim).

To edit `coc-settings.json` within Vim, use:

```
:CocConfig
```

## Key Mappings and Shortcuts

Below is a list of all key bindings and their actions from the `.vimrc`:

### Fold/Unfold when inside .vimrc:

- `zo`: Fold open.
- `zm`: Fold close.

### Editor

- `,`: Leader key
- `\\`: Jump back to the last cursor position
- `<leader>hh`: Turn off search highlighting (hide highlightings)
- `o`: Open a new line below the current one
- `O`: Open a new line above the current one
- `n`: Move to the next search match and center the cursor
- `N`: Move to the previous search match and center the cursor
- `Y`: Yank from cursor to the end of the line
- `<leader>p`: Fuzzy-find files with fzf
- `<leader>o`: Fuzzy-find git files with fzf
- `<leader>i`: Ripgrep within fuzzy-finder
- `<F4>`: Run Python script
- `<F5>`: Run Python script in a separate buffer
- `<F6>`: Run Node.js script
- `<F7>`: Run Node.js script in a separate buffer
- `CTRL+j/k/h/l`: Navigate split windows
- `CTRL+UP/DOWN/LEFT/RIGHT`: Resize split windows
- `<leader>w`: Quick save
- `<leader>q`: Quick quit
- `<leader>bn`: Next buffer
- `<leader>bp`: Previous buffer
- `<leader>n`: Exit to terminal Normal-mode
- `±`: Toggle NERDTree (Note for user: change mappings to something like `<leader>e` instead of `±` in .vimrc)
- `[g`: Previous diagnostic
- `]g`: Next diagnostic
- `gd`: Go to definition
- `gy`: Go to type definition
- `gi`: Go to implementation
- `gr`: Go to references
- `K`: Show documentation in preview window
- `<leader>rn`: Rename symbol
- `<leader>f`: Format selected code
- `<leader>a`: Apply code action to selected block
- `<leader>ac`: Apply code action to cursor position
- `<leader>as`: Apply code action to the whole buffer
- `<leader>qf`: Apply quick fix action
- `<leader>re`: Apply refactor code action
- `<leader>cl`: Run Code Lens action
- `<Ctrl-s>`: Select range
- `<space>a`: Show all diagnostics
- `<space>e`: Manage extensions
- `<space>c`: Show commands
- `<space>o`: Find symbol of the current document
- `<space>s`: Search workspace symbols
- `<space>j`: Do default action for the next item
- `<space>k`: Do default action for the previous item
- `<space>p`: Resume latest coc list
- `<leader>d`: Toggle diagnostic float window
- `<TAB>`: Scroll forward through completions
- `<Shift-TAB>`: Scroll backward through completions
- `<Esc>[1;5I`: Toggle completion menu (Note for user: change mappings to something like `<c-space>` instead of `<Esc>[1;5I` in .vimrc)
- `<leader>sc`: Toggle color highlight On/OFF (show color)
- `<leader>cc`: Change color when cursor is on a highlighted color. Color highlight must be ON.
- `Ctrl-l`: Trigger snippet expand
- `` Ctrl-` ``: Expand and jump (make expand higher priority)
- `Ctrl-j`: Jump to the next placeholder (default of coc.nvim)
- `Ctrl-k`: Jump to the previous placeholder (default of coc.nvim)
- `<leader>x`: Convert visual selected code to snippet

### Special Note on Keybinding Customization

1. The default behavior for toggling CoC completion is typically `<c-space>`, which may not work well on macOS. It is recommended to customize this mapping to fit your terminal and preferences. In my case I configured it to use `<Esc>[1;5I` (it's Ctrl+ Tab for me), but
   `<c-space>` is the default behavior. Any other mapping is encouraged, such as using `<leader>df`.

Here's an example of a custom mapping that can be adapted:

```vim
inoremap <silent><expr> <c-space> coc#pum#visible() ? coc#pum#stop() : coc#refresh()
```

This is something you might want to tweak to ensure optimal performance with your specific terminal setup.

2. The mapping `nnoremap ± :NERDTreeToggle<CR>` is a very personal setting of the creator and might not be suitable for everyone. It is encouraged to change this mapping to something that fits your preference better.
   Here's an example of a custom mapping that can be adapted:

```vim
nnoremap <leader>e :NERDTreeToggle<CR>
```

<img width="868" alt="Screenshot 2024-06-16 at 0 57 21" src="https://github.com/Blingoose/vimple_vimrc_config/assets/108837766/5039e015-45f7-4a1f-88fb-e2dc6bae5593">

<img width="1101" alt="Screenshot 2024-06-16 at 1 03 48" src="https://github.com/Blingoose/vimple_vimrc_config/assets/108837766/16351b69-27d1-4a0e-b685-7a86ab53679d">
