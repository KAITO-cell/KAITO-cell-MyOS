;haribote-os
;TAB=4

    ORG         0xc200      ;���̃v���O�������ǂ��ɓǂݍ��܂�邩

    MOV         AL,0x13     ;VGA�O���t�B�b�N�X�A320x200x8bitcolor
    MOV         AX,0x020�Ƃ������߂��Ȃ����߂����Ȃ�
    INT         0x10
fin:
    HLT
    JMP     fin
    