;haribote-os boot asm
;TAB=4

BOTPAK  EQU     0x00280000  ;bootpackのロード先
DSKCAC  EQU     0x00100000  ;ディスクキャッシュの場所
DSKCAC0 EQU     0x00008000  ;でぃすくキャッシュの場所
;BOOT_INFO関係
CYLS    EQU     0x0ff0      ;ブートセクタが設定する
LEDS    EQU     0x0ff1
VMODE   EQU     0x0ff2      ;色数に関する情報。何ビットカラーか
SCRNX   EQU     0x0ff4      ;解像度のx
SCRNY   EQU     0x0ff6      ;解像度のy
VRAM    EQU     0x0ff8      ;グラフィックバッファの開始番地

    ORG         0xc200      ;このプログラムがどこに読み込まれるか

    MOV         AL,0x13     ;VGAグラフィックス、320x200x8bitcolor
    MOV         AX,0x020という命令がないためこうなる
    INT         0x10
    MOV         BYTE [VMODE],8  ;画面モードをメモする
    MOV         WORD [SCRNX],320
    MOV         WORD [SCRNY],200
    MOV         DWORD [VRAM],0x000a0000
;キーボードのLED状態をBIOSにおしえてもらう

    MOV         AH,0x02
    INT         0x16        ;keyboraad BIOS
    MOV         [LEDS],AL
fin:
    HLT
    JMP     fin
