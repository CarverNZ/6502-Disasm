UNIT MOS_6502;

{$mode ObjFPC}{$H+}

INTERFACE

USES
    Classes, SysUtils, StdCtrls, Grids;

CONST
  OpCodes : ARRAY OF ANSISTRING = ('ADC','AND','ASL','BCC','BCS','BEQ','BIT','BMI','BNE','BPL','BRK','BVC','BVS','CLC','CLD','CLI','CLV','CMP','CPX','CPY','DEC','DEX','DEY','EOR',
  'INC','INX','INY','JMP','JSR','LDA','LDX','LDY','LSR','NOP','ORA','PHA','PHP','PLA','PLP','ROL','ROR','RTI','RTS','SBC','SEC','SED','SEI','STA','STX','STY','TAX','TAY','TSX',
  'TXA','TXS','TYA');


TYPE
    // As used in Atari 800XL

    { CPU_6502B }

    CPU_6502B = CLASS
        REG_X, REG_Y: BYTE;
        CF,   // Carry flag
        ZF,   // Zero Flag
        NF,   // Negative Flag
        VF: BYTE;         // Overflow Flag

        pneumonic: AnsiString;
        opcode: BYTE;
        inst_ptr: WORD;
        mem_ptr : WORD;
        param1, param2: BYTE;
        remark: AnsiString;
        param_cnt : BYTE;
        Memory_Array: Array[0..65535] of BYTE;
        Mem_Pos: WORD;
        instr_size: WORD;
        data_section: WORD; // address of start of data section
        data_size : WORD;


        CONSTRUCTOR Create;
        PROCEDURE ProcessOpcode;
        PROCEDURE ClearMem;
        PROCEDURE LoadFile( filename: AnsiString; StringGrid: TStringGrid );
    END;


IMPLEMENTATION

constructor CPU_6502B.Create;
begin
    inst_ptr := 0;
    mem_ptr := 0;
end;


procedure CPU_6502B.ProcessOpcode;
BEGIN
    Remark := '';
    param1 := 0;
    param2 := -1;
    OpCode := Memory_Array[ mem_pos ];
    CASE OpCode OF
        // ADC ( Add memory to accumulator with carry )
        $69: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $65: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $75: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          pneumonic := OpCodes[0];
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $6D: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $7D: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          pneumonic := OpCodes[0];
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $79: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          pneumonic := OpCodes[0];
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $61: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        $71: BEGIN
          pneumonic := OpCodes[0];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ADC ( Add memory to accumulator with carry )';
        END;
        // AND ( "AND" memory with accumulator )
        $29: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $25: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $35: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $2D: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $3D: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $39: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $21: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        $31: BEGIN
          pneumonic := OpCodes[1];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; AND ( "AND" memory with accumulator )';
        END;
        // ASL Shift left one bit (Memory or Accumulator)
        $0A: BEGIN
          pneumonic := OpCodes[2];
          param_cnt := 0;
          inc( Mem_Pos, 1 );
          remark := '; ASL Shift left one bit (Memory or Accumulator)';
        END;
        $06: BEGIN
          pneumonic := OpCodes[2];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ASL Shift left one bit (Memory or Accumulator)';
        END;
        $16: BEGIN
          pneumonic := OpCodes[2];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; ASL Shift left one bit (Memory or Accumulator)';
        END;
        $0E: BEGIN
          pneumonic := OpCodes[2];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          remark := '; ASL Shift left one bit (Memory or Accumulator)';
        END;
        $1E: BEGIN
          pneumonic := OpCodes[2];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
          remark := '; ASL Shift left one bit (Memory or Accumulator)';
        END;
        // BCC Branch on carry clear
        $90: BEGIN
          pneumonic := OpCodes[3];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; BCC Branch on carry clear';
        END;
        // BCS Branch on carry set
        $B0: BEGIN
          pneumonic := OpCodes[4];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; BCS Branch on carry set';
        END;
        // BEQ Branch on result zero
        $F0: BEGIN
          pneumonic := OpCodes[5];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; BEQ Branch on result zero';
        END;
        // BIT Test bits In memory with accumulator
        $24: BEGIN
          pneumonic := OpCodes[6];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; BIT Test bits In memory with accumulator';
        END;
        $2C: BEGIN
          pneumonic := OpCodes[6];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          remark := '; BIT Test bits In memory with accumulator';
        END;
        // BMI Branch on result minus
        $30: BEGIN
          pneumonic := OpCodes[7];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // BNE Branch on resu~ not zero
        $D0: BEGIN
          pneumonic := OpCodes[8];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // BPL Branch on result plus
        $10: BEGIN
          pneumonic := OpCodes[9];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // BRK Force break
        $00: BEGIN
          pneumonic := OpCodes[10];
          param_cnt := 0;
        END;
        // BVC Branch on overflow clear
        $50: BEGIN
          pneumonic := OpCodes[11];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // BVS Branch on overflow set
        $70: BEGIN
          pneumonic := OpCodes[12];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // CLC Clear carry flag
        $18: BEGIN
          pneumonic := OpCodes[13];
          param_cnt := 0;
        END;
        // CLD Clear decimal mode
        $D8: BEGIN
          pneumonic := OpCodes[14];
          param_cnt := 0;
        END;
        // CLI Clear interrupt disable status
        $58: BEGIN
          pneumonic := OpCodes[15];
          param_cnt := 0;
        END;
        // CLV Clear overflow flag
        $B8: BEGIN
          pneumonic := OpCodes[16];
          param_cnt := 0;
        END;
        // CMP Compare memory and accumulator
        $C9: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $C5: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $D5: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $CD: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $DD: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $D9: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $C1: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $D1: BEGIN
          pneumonic := OpCodes[17];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // CPX Compare memory and index X
        $E0: BEGIN
          pneumonic := OpCodes[18];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $E4: BEGIN
          pneumonic := OpCodes[18];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $EC: BEGIN
          pneumonic := OpCodes[18];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // CPY Compare memory and index Y
        $C0: BEGIN
          pneumonic := OpCodes[19];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $C4: BEGIN
          pneumonic := OpCodes[19];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $CC: BEGIN
          pneumonic := OpCodes[19];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // DEC Decrement memory by one
        $C6: BEGIN
          pneumonic := OpCodes[20];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $D6: BEGIN
          pneumonic := OpCodes[20];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $CE: BEGIN
          pneumonic := OpCodes[20];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $DE: BEGIN
          pneumonic := OpCodes[20];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // DEX Decrement index X by one
        $CA: BEGIN
          pneumonic := OpCodes[21];
          param_cnt := 0;
        END;
        // DEY Decrement index Y by one
        $88: BEGIN
          pneumonic := OpCodes[22];
          param_cnt := 0;
        END;
        // EOR "Exclusive-Or" memory with accumulator
        $49: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $45: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $55: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $4D: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $5D: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $59: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $41: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $51: BEGIN
          pneumonic := OpCodes[23];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // INC Increment memory by one
        $E6: BEGIN
          pneumonic := OpCodes[24];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $F6: BEGIN
          pneumonic := OpCodes[24];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $EE: BEGIN
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
          pneumonic := OpCodes[24];
        END;
        $FE: BEGIN
          pneumonic := OpCodes[24];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // INX Increment index X by one
        $E8: BEGIN
          pneumonic := OpCodes[25];
          param_cnt := 0;
        END;
        // INY Increment index Y by one
        $C8: BEGIN
          pneumonic := OpCodes[26];
          param_cnt := 0;
        END;
        // JMP Jump to new location
        $4C: BEGIN
          pneumonic := OpCodes[27];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $6C: BEGIN
          pneumonic := OpCodes[27];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // JSR Jump to new location saving return address
        $20: BEGIN
          pneumonic := OpCodes[28];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // LDA Load accumulator with memory
        $A9: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $A5: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $B5: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $AD: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $BD: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $B9: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $A1: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $B1: BEGIN
          pneumonic := OpCodes[29];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // LDX Load Index X with memory
        $A2: BEGIN
          pneumonic := OpCodes[30];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $A6: BEGIN
          pneumonic := OpCodes[30];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $B6: BEGIN
          pneumonic := OpCodes[30];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $AE: BEGIN
          pneumonic := OpCodes[30];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $BE: BEGIN
          pneumonic := OpCodes[30];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // LDY Load Index Y with memory
        $A0: BEGIN
          pneumonic := OpCodes[31];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $A4: BEGIN
          pneumonic := OpCodes[31];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $B4: BEGIN
          pneumonic := OpCodes[31];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $AC: BEGIN
          pneumonic := OpCodes[31];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $BC: BEGIN
          pneumonic := OpCodes[31];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // LSR Shift right one bit (memory or accumulator)
        $4A: BEGIN
          pneumonic := OpCodes[32];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $46: BEGIN
          pneumonic := OpCodes[32];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $56: BEGIN
          pneumonic := OpCodes[32];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $4E: BEGIN
          pneumonic := OpCodes[32];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $5E: BEGIN
          pneumonic := OpCodes[32];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // NOP No operation
        $EA: BEGIN
          pneumonic := OpCodes[33];
          param_cnt := 0;
        END;
        // ORA "OR" memory with accumulator
        $09: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $05: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $15: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $0D: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $1D: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $19: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $01: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $11: BEGIN
          pneumonic := OpCodes[34];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // PHA Push accumulator on stack
        $48: BEGIN
          pneumonic := OpCodes[35];
          param_cnt := 0;
        END;
        // PHP Push processor status on stack
        $08: BEGIN
          pneumonic := OpCodes[36];
          param_cnt := 0;
        END;
        // PLA Pull accumulator from stack
        $68: BEGIN
          pneumonic := OpCodes[37];
          param_cnt := 0;
        END;
        // PLP Pull processor status from stack
        $28: BEGIN
          pneumonic := OpCodes[38];
          param_cnt := 0;
        END;
        // ROL Rotate one bit left (memory or acx:umulator)
        $2A: BEGIN
          pneumonic := OpCodes[39];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $26: BEGIN
          pneumonic := OpCodes[39];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $36: BEGIN
          pneumonic := OpCodes[39];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $2E: BEGIN
          pneumonic := OpCodes[39];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $3E: BEGIN
          pneumonic := OpCodes[39];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // ROR Rotate one btt right (memory or accumulator)
        $6A: BEGIN
          pneumonic := OpCodes[40];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $66: BEGIN
          pneumonic := OpCodes[40];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $76: BEGIN
          pneumonic := OpCodes[40];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $6E: BEGIN
          pneumonic := OpCodes[40];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $7E: BEGIN
          pneumonic := OpCodes[40];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // RTI Return from interrupt
        $40: BEGIN
          pneumonic := OpCodes[41];
          param_cnt := 0;
        END;
        // RTS Return from subroutine
        $60: BEGIN
          pneumonic := OpCodes[42];
          param_cnt := 0;
        END;
        // SBC Subtract memory from accumulator with borrow
        $E9: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $E5: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $F5: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $ED: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $FD: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $F9: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $E1: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $F1: BEGIN
          pneumonic := OpCodes[43];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // SEC set carry flag
        $38: BEGIN
          pneumonic := OpCodes[44];
          param_cnt := 0;
        END;
        // SED set carry flag
        $F8: BEGIN
          pneumonic := OpCodes[45];
          param_cnt := 0;
        END;
        // SEI set carry flag
        $78: BEGIN
          pneumonic := OpCodes[46];
          param_cnt := 0;
        END;
        // STA Store accumulator in memory
        $85: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $95: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $8D: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $9D: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $99: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $81: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $91: BEGIN
          pneumonic := OpCodes[47];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        // STX Store index X in memory
        $86: BEGIN
          pneumonic := OpCodes[48];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $96: BEGIN
          pneumonic := OpCodes[48];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $8E: BEGIN
          pneumonic := OpCodes[48];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // STY Store index Y in memory
        $84: BEGIN
          pneumonic := OpCodes[49];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        $94: BEGIN
          pneumonic := OpCodes[49];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          inc( Mem_Pos, 1 );
          param2 := Memory_Array[ mem_pos ];
          param_cnt := 2;
        END;
        $8C: BEGIN
          pneumonic := OpCodes[49];
          inc( Mem_Pos, 1 );
          param1 := Memory_Array[ mem_pos ];
          param_cnt := 1;
        END;
        // TAX Transfer accumulator to index X
        $AA: BEGIN
          pneumonic := OpCodes[50];
          param_cnt := 0;
        END;
        // TAY Transfer accumulator to index Y
        $A8: BEGIN
          pneumonic := OpCodes[51];
          param_cnt := 0;
        END;
        // TSX Transfer index X to stack pointer
        $BA: BEGIN
          pneumonic := OpCodes[52];
          param_cnt := 0;
        END;
        // TXA Transfer Index X to accumulator
        $8A: BEGIN
          pneumonic := OpCodes[53];
          param_cnt := 0;
        END;
        // TXS Transfer Index X to stack ptr
        $9A: BEGIN
          pneumonic := OpCodes[54];
          param_cnt := 0;
          remark := '; TXS Transfer Index X to stack ptr';
        END;
        // TYA Transfer Index Y to accumulator
        $98: BEGIN
          pneumonic := OpCodes[55];
          param_cnt := 0;
        END;
        ELSE
          pneumonic := '???';
    END;
END;


procedure CPU_6502B.ClearMem;
VAR i:Integer;
begin
     for i := 0 to 65535 do
         Memory_Array[i] := 0;
end;

procedure CPU_6502B.LoadFile( filename: AnsiString; StringGrid: TStringGrid );
VAR datFile    : File of Char;
  str: AnsiString;
  i: Longint;
  row: LongInt = 0;
  val: Byte;
begin
    AssignFile(datFile, filename);
    Reset(datFile);
    ClearMem;
    instr_size := FileSize( datFile );
    BlockRead( datFile, Memory_Array, instr_size );
    close( datFile );
    str := '';
    Mem_Pos := 0;

    StringGrid.Cells[0, 0] := ' Address ';
    StringGrid.Cells[1, 0] := ' OpCode ';
    StringGrid.Cells[2, 0] := ' Instruction ';
    StringGrid.Cells[3, 0] := ' Parameters ';
    StringGrid.Cells[4, 0] := ' Remarks ';
    StringGrid.Cells[5, 0] := ' Assembly ';

    inc( row );
    for i := Mem_Pos to instr_size-1 do
        Begin
           ProcessOpcode;
           Val :=Memory_Array[Mem_Pos-1];
           StringGrid.Cells[0, row] := format( '%U  ($%X)',[ Mem_Pos-1, Mem_Pos-1 ] );
           StringGrid.Cells[1, row] := format( '$%X', [Opcode] );
           StringGrid.Cells[2, row] := pneumonic;
           case param_cnt of
                0: str := '';
                1: str := format( '%X',[param1]);
                2: str := format( '$%X, %X',[param1, param2]);
           End;
           StringGrid.Cells[3, row] := str;
           StringGrid.Cells[4, row] := remark;
           StringGrid.Cells[5, row] := format('%S %S',[pneumonic, str]);
           inc( row, 1 );
           inc( Mem_Pos, 1 );
        end;
    StringGrid.RowCount := row;
end;

END.

