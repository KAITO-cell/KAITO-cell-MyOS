;haribote-os
;TAB=4

    ORG         0xc200      ;このプログラムがどこに読み込まれるか

    MOV         AL,0x13     ;VGAグラフィックス、320x200x8bitcolor
    MOV         AX,0x020という命令がないためこうなる
    INT         0x10
fin:
    HLT
    JMP     fin
    