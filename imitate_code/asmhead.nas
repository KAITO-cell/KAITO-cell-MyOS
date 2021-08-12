;haribote-os boot asm
;TAB=4

BOTPAK  EQU     0x00280000  ;bootpack�̃��[�h��
DSKCAC  EQU     0x00100000  ;�f�B�X�N�L���b�V���̏ꏊ
DSKCAC0 EQU     0x00008000  ;�ł������L���b�V���̏ꏊ
;BOOT_INFO�֌W
CYLS    EQU     0x0ff0      ;�u�[�g�Z�N�^���ݒ肷��
LEDS    EQU     0x0ff1
VMODE   EQU     0x0ff2      ;�F���Ɋւ�����B���r�b�g�J���[��
SCRNX   EQU     0x0ff4      ;�𑜓x��x
SCRNY   EQU     0x0ff6      ;�𑜓x��y
VRAM    EQU     0x0ff8      ;�O���t�B�b�N�o�b�t�@�̊J�n�Ԓn

    ORG         0xc200      ;���̃v���O�������ǂ��ɓǂݍ��܂�邩

    MOV         AL,0x13     ;VGA�O���t�B�b�N�X�A320x200x8bitcolor
    MOV         AX,0x020�Ƃ������߂��Ȃ����߂����Ȃ�
    INT         0x10
    MOV         BYTE [VMODE],8  ;��ʃ��[�h����������
    MOV         WORD [SCRNX],320
    MOV         WORD [SCRNY],200
    MOV         DWORD [VRAM],0x000a0000
;�L�[�{�[�h��LED��Ԃ�BIOS�ɂ������Ă��炤

    MOV         AH,0x02
    INT         0x16        ;keyboraad BIOS
    MOV         [LEDS],AL
fin:
    HLT
    JMP     fin
