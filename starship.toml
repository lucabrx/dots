"$schema" = 'https://starship.rs/config-schema.json'

format = """
$username\
$os\
$directory\
$git_branch\
$git_status\
$golang\
$memory_usage\
$line_break\
$time\
$character"""

add_newline = true

[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"

[directory]
style = "blue bold"
truncation_length = 5
truncate_to_repo = false
format = "[$path]($style) "

[git_branch]
symbol = "🌱 "
style = "bold purple"
format = "on [$symbol$branch]($style) "

[git_status]
style = "bold yellow"
format = '[$all_status$ahead_behind]($style) '

[memory_usage]
disabled = false
threshold = -1
symbol = "🐏 "
style = "bold dimmed green"
format = "via $symbol[${ram}( | ${swap})]($style) "

[time]
disabled = false
format = "[$time]($style) "
time_format = "%H:%M:%S"
style = "bold blue"

[username]
style_user = "white bold"
format = "[$user]($style) "
show_always = true

[os]
format = "[$symbol](bold white) "
disabled = false

[os.symbols]
Alpine = "🏔️ "
Amazon = "🙂 "
Android = "🤖 "
Arch = "🎗️ "
CentOS = "💠 "
Debian = "🍥 "
DragonFly = "🐉 "
Emscripten = "🔗 "
EndeavourOS = "🚀 "
Fedora = "🎩 "
FreeBSD = "😈 "
Garuda = "🦅 "
Gentoo = "🗜️ "
HardenedBSD = "🛡️ "
Illumos = "🐦 "
Linux = "🐧"
Macos = "🍎 "
Manjaro = "🥭 "
Mariner = "🌊 "
MidnightBSD = "🌘 "
Mint = "🌿 "
NetBSD = "🚩 "
NixOS = "❄️ "
OpenBSD = "🐡 "
openSUSE = "🦎 "
OracleLinux = "🦴 "
Pop = "🍭 "
Raspbian = "🍓 "
Redhat = "🎩 "
RedHatEnterprise = "🎩 "
Redox = "🧪 "
Solus = "⛵ "
SUSE = "🦎 "
Ubuntu = "🎯 "
Unknown = "❓ "
Windows = "🪟 "
