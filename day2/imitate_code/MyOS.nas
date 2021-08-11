;hello-os
;TAB=4
        ORG     0x7c00;このプログラムがどこに読み込まれるか
;FAT12フォーマットフロッピーディスクのための記述
        JMP     entry
        DB      0x90
        DB      "HELLOIPL"              ;ブートセクタの名前を自由にかいてよい(8バイト)
        DW      512                     ;1セクタの大きさ(512にしなければいけない)
        DB      1                       ;クラスタの大きさ(1セクタにしなければいけない)
        DW      1                       ;FATがどこから始まるか(普通は1セクタ目からにする)
        DB      2                       ;FATの個数(2にしなければいけない)
        DW      224                     ;ルートディレクトリ領域の大きさ(普通は224エントリにする)
        DW      2880                    ;このドライブの大きさ(2880セクタにしなければいけない)
        DB      0xf0                    ;メディアのタイプ(0xf0にしなければいけない)
        DW      9                       ;FAT領域の長さ(9セクタにしなければいけない)
        DW      18                      ;1トラックにいくつのセクタがあるか(18にしなければいけない)
        DW      2                       ;ヘッドの数(2にしなければいけない)
        DD      0                       ;パーティーしょんを使ってないのでここは0
        DD      2880                    ;このドライブの大きさをもう一度書く
        DB      0,0,0x29                ;よくわからないけどこの値にしておくとよいらしい
        DD      0xffffffff              ;多分ボリュームシリアル番号
        DB      "HELLO-OS   "           ;ディスクの名前(11バイト)
        DB      "FAT12"                 ;フォーマットの名前(8バイト)
        RESB    18                      ;とりあえず18バイト開けておく

;プログラム本体
entry:
        MOV     AX,0            ;レジスタ初期化
        MOV     SS,AX
        MOV     SP,0x7c00
        MOV     DS,AX
        MOV     ES,AX

        MOV     SI,msg
putloop:
        MOV     AL,[SI]
        ADD     SI,1            ;SIに1をたす
        CMP     AL,0
        JE      fin
        MOV     AH,0x0e         ;一文字表示ファンクション
        MOV     BX,15           ;カラーコード
        INT     0x10            ;ビデオBIOS呼び出し
        JMP     putloop
fin:
        HLT                     ;なにかあるまでCPUを停止
        JMP     fin             ;無限ループ
msg:
        DB      0x0a, 0x0a      ;改行を2つ
        DB      "love your self"  
        DB      0x0a            ;改行

        RESB    0x7dfe-$        ;0x7dfeまでを0x00で埋める命令

        DB      0x55, 0xaa

;以下はブートセクタ以外の部分の記述
        DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
        RESB    4600
        DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
        RESB    1469432