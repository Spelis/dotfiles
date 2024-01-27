# credits to theova/base16-qutebrowser for the original template
c = c

##########
# COLORS #
##########

# base16 colors but with variable names that
# reflect what the color is mainly used for

# for reference: AARRGGBB 80ff00aa
#                         AARRGGBB

bg_default = "#1a1b26"  # main shade darkest
bg_transp = "#801a1b26"
bg_lighter = "#1a1b26"
bg_selection = "#24283b"
fg_disabled = "#565f89"
fg_default = "#a9b1d6"
bg_lightest = "#24283b"  # main shade lightest
fg_error = "#f7768e"  # red
bg_hint = "#8f5e15"  # yellow
fg_matched_text = "#33635c"  # green
bg_passthrough_mode = "#a9b1d6"  # teal
bg_insert_mode = "#34548a"  # blue
bg_warning = "#5a4a78"  # purple
transparent = "transparent"

############
# SETTINGS #
############

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = fg_default
c.colors.completion.odd.bg = bg_lighter
c.colors.completion.even.bg = bg_default
c.colors.completion.category.fg = bg_hint
c.colors.completion.category.bg = bg_default
c.colors.completion.category.border.top = bg_default
c.colors.completion.category.border.bottom = bg_default
c.colors.completion.item.selected.fg = fg_default
c.colors.completion.item.selected.bg = bg_selection
c.colors.completion.item.selected.border.top = bg_selection
c.colors.completion.item.selected.border.bottom = bg_selection
c.colors.completion.item.selected.match.fg = fg_matched_text
c.colors.completion.match.fg = fg_matched_text
c.colors.completion.scrollbar.fg = fg_default
c.colors.completion.scrollbar.bg = bg_default
c.colors.contextmenu.disabled.bg = bg_lighter
c.colors.contextmenu.disabled.fg = fg_disabled
c.colors.contextmenu.menu.bg = bg_default
c.colors.contextmenu.menu.fg = fg_default
c.colors.contextmenu.selected.bg = bg_selection
c.colors.contextmenu.selected.fg = fg_default
c.colors.downloads.bar.bg = bg_default
c.colors.downloads.start.fg = bg_default
c.colors.downloads.start.bg = bg_insert_mode
c.colors.downloads.stop.fg = bg_default
c.colors.downloads.stop.bg = bg_passthrough_mode
c.colors.downloads.error.fg = fg_error
c.colors.hints.fg = bg_default
c.colors.hints.bg = bg_hint
c.colors.hints.match.fg = fg_default
c.colors.keyhint.fg = fg_default
c.colors.keyhint.suffix.fg = fg_default
c.colors.keyhint.bg = bg_default
c.colors.messages.error.fg = bg_default
c.colors.messages.error.bg = fg_error
c.colors.messages.error.border = fg_error
c.colors.messages.warning.fg = bg_default
c.colors.messages.warning.bg = bg_warning
c.colors.messages.warning.border = bg_warning
c.colors.messages.info.fg = fg_default
c.colors.messages.info.bg = bg_default
c.colors.messages.info.border = bg_default
c.colors.prompts.fg = fg_default
c.colors.prompts.border = bg_default
c.colors.prompts.bg = bg_default
c.colors.prompts.selected.bg = bg_selection
c.colors.prompts.selected.fg = fg_default
c.colors.statusbar.normal.fg = fg_matched_text
c.colors.statusbar.normal.bg = transparent
c.colors.statusbar.insert.fg = bg_insert_mode
c.colors.statusbar.insert.bg = bg_default
c.colors.statusbar.passthrough.fg = bg_default
c.colors.statusbar.passthrough.bg = bg_passthrough_mode
c.colors.statusbar.private.bg = bg_lighter
c.colors.statusbar.command.fg = fg_default
c.colors.statusbar.command.bg = transparent
c.colors.statusbar.command.private.fg = fg_default
c.colors.statusbar.command.private.bg = bg_default
c.colors.statusbar.caret.fg = bg_default
c.colors.statusbar.caret.bg = bg_warning
c.colors.statusbar.caret.selection.fg = bg_default
c.colors.statusbar.caret.selection.bg = bg_insert_mode
c.colors.statusbar.progress.bg = bg_insert_mode
c.colors.statusbar.url.fg = fg_default
c.colors.statusbar.url.error.fg = fg_error
c.colors.statusbar.url.hover.fg = fg_default
c.colors.statusbar.url.success.http.fg = bg_passthrough_mode
c.colors.statusbar.url.success.https.fg = fg_matched_text
c.colors.statusbar.url.warn.fg = bg_warning
c.colors.tabs.bar.bg = transparent
c.colors.tabs.indicator.start = bg_insert_mode
c.colors.tabs.indicator.stop = bg_passthrough_mode
c.colors.tabs.indicator.error = fg_error
c.colors.tabs.odd.fg = fg_default
c.colors.tabs.odd.bg = transparent
c.colors.tabs.even.fg = fg_default
c.colors.tabs.even.bg = transparent
c.colors.tabs.pinned.even.bg = bg_passthrough_mode
c.colors.tabs.pinned.even.fg = bg_default
c.colors.tabs.pinned.odd.bg = fg_matched_text
c.colors.tabs.pinned.odd.fg = bg_default
c.colors.tabs.pinned.selected.even.bg = bg_selection
c.colors.tabs.pinned.selected.even.fg = fg_default
c.colors.tabs.pinned.selected.odd.bg = bg_selection
c.colors.tabs.pinned.selected.odd.fg = fg_default
c.colors.tabs.selected.odd.fg = fg_default
c.colors.tabs.selected.odd.bg = bg_transp
c.colors.tabs.selected.even.fg = fg_default
c.colors.tabs.selected.even.bg = bg_transp
c.colors.webpage.bg = "black"
