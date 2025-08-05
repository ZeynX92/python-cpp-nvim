#  Конфигурация NeoVim для Python и C++
## Установка
### Arch Linux
1) `yay neovim` - установите сам NeoVim
2) `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` - установите менеджер пакетов
3) `git clone https://github.com/ZeynX92/python-cpp-nvim.git'` - скопируйте файлы конфигурации
4) `mkdir ~/.config/nvim` - создайте папку конфигурации NeoVim
5) `mv python-cpp-nvim/* ~/.config/nvim/` - перенесите все файлы конфигурации в созданную директорию
6) `yay python-lsp-server` - установите LSP сервер для python
7) `yay clang` - установите LSP сервер для C++
8) `yay autopep8` - установите допольнительный модуль для python-lsp-server, чтобы автоформатирование по PEP8 работало корректно
9) Зайдите в NeoVim `nvim .` и в COMMAND режиме используйте `:PlugInstall`, после перезагрузки ваш NeoVim готов к работе.
## Модифицированая раскладка управления
В моей конфигурации был добавлен ряд горячих клавиш, которых не было в изначальном состоянии. Ниже будет преведена таблица с ними.
