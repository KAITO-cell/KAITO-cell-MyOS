;hello-os
;TAB=4
        ORG     0x7c00;���̃v���O�������ǂ��ɓǂݍ��܂�邩
;FAT12�t�H�[�}�b�g�t���b�s�[�f�B�X�N�̂��߂̋L�q
        JMP     entry
        DB      0x90
        DB      "HELLOIPL"              ;�u�[�g�Z�N�^�̖��O�����R�ɂ����Ă悢(8�o�C�g)
        DW      512                     ;1�Z�N�^�̑傫��(512�ɂ��Ȃ���΂����Ȃ�)
        DB      1                       ;�N���X�^�̑傫��(1�Z�N�^�ɂ��Ȃ���΂����Ȃ�)
        DW      1                       ;FAT���ǂ�����n�܂邩(���ʂ�1�Z�N�^�ڂ���ɂ���)
        DB      2                       ;FAT�̌�(2�ɂ��Ȃ���΂����Ȃ�)
        DW      224                     ;���[�g�f�B���N�g���̈�̑傫��(���ʂ�224�G���g���ɂ���)
        DW      2880                    ;���̃h���C�u�̑傫��(2880�Z�N�^�ɂ��Ȃ���΂����Ȃ�)
        DB      0xf0                    ;���f�B�A�̃^�C�v(0xf0�ɂ��Ȃ���΂����Ȃ�)
        DW      9                       ;FAT�̈�̒���(9�Z�N�^�ɂ��Ȃ���΂����Ȃ�)
        DW      18                      ;1�g���b�N�ɂ����̃Z�N�^�����邩(18�ɂ��Ȃ���΂����Ȃ�)
        DW      2                       ;�w�b�h�̐�(2�ɂ��Ȃ���΂����Ȃ�)
        DD      0                       ;�p�[�e�B�[�������g���ĂȂ��̂ł�����0
        DD      2880                    ;���̃h���C�u�̑傫����������x����
        DB      0,0,0x29                ;�悭�킩��Ȃ����ǂ��̒l�ɂ��Ă����Ƃ悢�炵��
        DD      0xffffffff              ;�����{�����[���V���A���ԍ�
        DB      "HELLO-OS   "           ;�f�B�X�N�̖��O(11�o�C�g)
        DB      "FAT12"                 ;�t�H�[�}�b�g�̖��O(8�o�C�g)
        RESB    18                      ;�Ƃ肠����18�o�C�g�J���Ă���

;�v���O�����{��
entry:
        MOV     AX,0            ;���W�X�^������
        MOV     SS,AX
        MOV     SP,0x7c00
        MOV     DS,AX
        MOV     ES,AX

        MOV     SI,msg
putloop:
        MOV     AL,[SI]
        ADD     SI,1            ;SI��1������
        CMP     AL,0
        JE      fin
        MOV     AH,0x0e         ;�ꕶ���\���t�@���N�V����
        MOV     BX,15           ;�J���[�R�[�h
        INT     0x10            ;�r�f�IBIOS�Ăяo��
        JMP     putloop
fin:
        HLT                     ;�Ȃɂ�����܂�CPU���~
        JMP     fin             ;�������[�v
msg:
        DB      0x0a, 0x0a      ;���s��2��
        DB      "love your self"  
        DB      0x0a            ;���s

        RESB    0x7dfe-$        ;0x7dfe�܂ł�0x00�Ŗ��߂閽��

        DB      0x55, 0xaa

;�ȉ��̓u�[�g�Z�N�^�ȊO�̕����̋L�q
        DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
        RESB    4600
        DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
        RESB    1469432