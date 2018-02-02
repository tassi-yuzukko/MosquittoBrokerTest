rem 文字コードをUTF8に変換
chcp 65001

rem 引数１：ループ回数、引数２：バイト数、引数３：ブローカー（オプション）

rem 引数がない場合は終了
if "%2"=="" (goto :EOF)

if "%3"=="" (set host=localhost) else (set host=%3)

rem 遅延環境変数の展開
setlocal enabledelayedexpansion

set message=
for /l %%m in (1, 1, %2) do (
  set message=!message!aaaaaaaaaa
)

for /l %%n in (1, 1, %1) do (
  mosquitto_pub -t %%n -m %message% -h %host% -r
)

echo 終了！
pause