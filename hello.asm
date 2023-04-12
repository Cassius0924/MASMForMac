;此汇编程序功能是输出一串字符串"hello world!"，并且在屏幕上显示出来

DATAS SEGMENT   ;定义数据段

    STRING DB 'hello world!', '$'  ;定义字符串，以$结束

DATAS ENDS  ;数据段结束

STACKS SEGMENT ;定义堆栈段

    DW 20h DUP(0)   ;定义堆栈段

STACKS ENDS ;堆栈段结束

CODES SEGMENT ;定义代码段

    ASSUME CS:CODES, DS:DATAS, SS:STACKS    ;定义代码段，数据段，堆栈段

START:  ;程序开始

MOV AX, DATAS   ;将数据段的段地址赋给AX
MOV DS, AX      ;将AX的值赋给DS
LEA DX, STRING  ;将字符串的地址赋给DX
MOV AH, 09H     ;将09H赋给AH
INT 21H         ;调用21H中断
MOV AH, 4CH     ;将4CH赋给AH
INT 21H         ;调用21H中断

CODES ENDS  ;代码段结束
END START   ;程序结束