rem 文字コードをUTF8に変換
chcp 65001

rem 引数１：ループ回数、引数２：メッセージ内容、引数３：ブローカー（オプション）

rem 引数がない場合は終了
if "%2"=="" (goto :EOF)

if "%3"=="" (set host=localhost) else (set host=%3)

for /l %%n in (1, 1, %1) do (
  mosquitto_pub -t %%n -m %2 -h %host% -r
)

echo 終了！
pause