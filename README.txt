MATLABをインストールしないと動きません.

"使い方"
ピンクノイズをスピーカーで再生して, 15秒間スマートフォンで録音します.
任意の3か所で同時に行ってください.
その録音データをwav形式で
任意のディレクトリに
sample1.wav
sample2.wav
sample3.wav
として保存します.
MATLABを起動してワークスペースにSpeaker_tuner.mlappを追加します.
コマンドを以下のようにして実行するとアプリが起動します.
>>Speaker_tuner
MODEをMAINにして, referenceボタンで録音ファイルが保存されているディレクトリを選択してください.
RUNボタンで実行すると
環境によって拡張されてしまっている周波数帯域が表で表示されます.
表に従って, GEQ(グラフィックイコライザー)で処理してください.
Hzに拡張されている周波数帯域, dBにどれくらい下げたら良いかが示されます.

SUBモードでは, 
sample_sub.wav
を解析します.
チャンエルデバイダー等で大まかな調整を行う際にお使いください.


You need to install MATLAB to run it.

"How to use"
Play the pink noise on your speakers and record it on your smartphone for 15 seconds.
Do it at any three locations at the same time.
Put the recorded data in wav format
Place it in a directory of your choice as
sample1.wav
sample2.wav
sample3.wav
Save it as
Start MATLAB and add Speaker_tuner.mlapp to your workspace.
Run the command as follows to start the application.
>>Speaker_tuner
Set MODE to MAIN, and select the directory where the recording files are saved by pressing reference button.
Press the RUN button to run the application.
A table will be displayed showing the frequency bands that have been expanded depending on the environment.
According to the table, use GEQ (Graphic Equalizer) to process it.
The table will show you the frequency range that is extended in Hz, and how much you should reduce it in dB.

In SUB mode, 
sample_sub.wav
is analyzed.
You can use this mode to make rough adjustments with a channel divider.
